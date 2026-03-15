#!/usr/bin/env python3
"""Create a new C64 project from projects/TEMPLATE.

Windows-friendly backend used by tools/new_project.bat.
"""

from __future__ import annotations

import re
import shutil
import subprocess
import sys
from pathlib import Path

PROJECT_NAME_FIXED = "main"


def die(msg: str) -> None:
    print(f"Error: {msg}", file=sys.stderr)
    raise SystemExit(1)


def normalize_name(raw: str) -> str:
    cleaned = raw.strip().replace(" ", "_").replace("-", "_")
    cleaned = re.sub(r"[^A-Za-z0-9_]", "", cleaned)
    if not cleaned:
        die(f"invalid project name: {raw!r}")
    return cleaned


def run(cmd: list[str], cwd: Path | None = None) -> int:
    proc = subprocess.run(cmd, cwd=str(cwd) if cwd else None)
    return proc.returncode


def generate_build_bat(project_dir: Path) -> None:
    content = r"""@echo off
setlocal
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..\..") do set "C64_ROOT=%%~fI"
set "KICKASS=%C64_ROOT%\KickAssembler\KickAss.jar"
set "BUILD_DIR=%C64_ROOT%\build"
set "VICE_EXE=%C64_ROOT%\GTK3VICE-3.10-win64\bin\x64sc.exe"

if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

echo === Building ===
java -jar "%KICKASS%" "%SCRIPT_DIR%main.asm" -debugdump -debug -symbolfile -odir "%BUILD_DIR%" -o "%BUILD_DIR%\main.prg"
if errorlevel 1 (
  echo Build failed.
  exit /b 1
)

echo Build successful: "%BUILD_DIR%\main.prg"

if /I "%~1"=="run" (
  "%VICE_EXE%" -autostart "%BUILD_DIR%\main.prg"
)

if /I "%~1"=="debug" (
  "%VICE_EXE%" -moncommands "%BUILD_DIR%\main.sym" -autostart "%BUILD_DIR%\main.prg"
)
"""
    (project_dir / "build.bat").write_text(content, encoding="utf-8", newline="\r\n")


def generate_build_sh(project_dir: Path) -> None:
    content = """#!/bin/bash
set -e
SCRIPT_DIR=\"$(cd \"$(dirname \"$0\")\" && pwd)\"
C64_ROOT=\"$(cd \"$SCRIPT_DIR/../..\" && pwd)\"
KICKASS=\"$C64_ROOT/KickAssembler/KickAss.jar\"
BUILD_DIR=\"$C64_ROOT/build\"
mkdir -p \"$BUILD_DIR\"
java -jar \"$KICKASS\" \"$SCRIPT_DIR/main.asm\" -debugdump -debug -symbolfile -odir \"$BUILD_DIR\" -o \"$BUILD_DIR/main.prg\"

if [ \"$1\" = \"run\" ]; then
  case \"$(uname -s)\" in
    Darwin) VICE=\"$C64_ROOT/vice-arm64-gtk3-3.10/bin/x64sc\" ;;
    Linux) VICE=\"x64sc\" ;;
    *) VICE=\"$C64_ROOT/GTK3VICE-3.10-win64/bin/x64sc.exe\" ;;
  esac
  \"$VICE\" -autostart \"$BUILD_DIR/main.prg\"
fi

if [ \"$1\" = \"debug\" ]; then
  case \"$(uname -s)\" in
    Darwin) VICE=\"$C64_ROOT/vice-arm64-gtk3-3.10/bin/x64sc\" ;;
    Linux) VICE=\"x64sc\" ;;
    *) VICE=\"$C64_ROOT/GTK3VICE-3.10-win64/bin/x64sc.exe\" ;;
  esac
  \"$VICE\" -moncommands \"$BUILD_DIR/main.sym\" -autostart \"$BUILD_DIR/main.prg\"
fi
"""
    p = project_dir / "build.sh"
    p.write_text(content, encoding="utf-8", newline="\n")
    try:
        p.chmod(0o755)
    except OSError:
        pass


def main() -> None:
    if len(sys.argv) < 2:
        print("Usage: new_project.py <project_name>")
        raise SystemExit(1)

    script_dir = Path(__file__).resolve().parent
    root = script_dir.parent
    template_dir = root / "projects" / "TEMPLATE"
    projects_dir = root / "projects"

    if not template_dir.exists():
        die(f"template directory not found: {template_dir}")

    project_name = normalize_name(sys.argv[1])
    project_dir = projects_dir / project_name
    if project_dir.exists():
        die(f"project already exists: {project_dir}")

    project_dir.mkdir(parents=True, exist_ok=False)
    shutil.copy2(template_dir / "main.asm", project_dir / "main.asm")
    generate_build_sh(project_dir)
    generate_build_bat(project_dir)

    set_active = [
        sys.executable,
        str(script_dir / "set_active_project.py"),
        str(root),
        f"projects/{project_name}/main.asm",
    ]
    run(set_active)

    print(f"Created: {project_dir}")
    print("Use on Windows:")
    print(f"  {project_dir / 'build.bat'}")


if __name__ == "__main__":
    main()
