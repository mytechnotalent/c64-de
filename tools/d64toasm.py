#!/usr/bin/env python3
"""Convert a D64 image into a KickAssembler project (Windows-friendly).

This backend powers tools/d64toasm.bat and avoids requiring Git Bash.
"""

from __future__ import annotations

import re
import shutil
import subprocess
import sys
from pathlib import Path


def die(msg: str) -> None:
    print(f"Error: {msg}", file=sys.stderr)
    raise SystemExit(1)


def run_capture(cmd: list[str], cwd: Path | None = None) -> subprocess.CompletedProcess[str]:
    return subprocess.run(cmd, cwd=str(cwd) if cwd else None, capture_output=True, text=True)


def safe_name(name: str) -> str:
    out = name.lower()
    out = re.sub(r"[ +.]", "_", out)
    out = re.sub(r"_+", "_", out).strip("_")
    return out


def parse_directory_listing(list_output: str) -> list[str]:
    names: list[str] = []
    for line in list_output.splitlines():
        m = re.search(r'"([^"]+)"\s+prg\b', line, re.IGNORECASE)
        if m:
            names.append(m.group(1))
    return names


def read_load_address(prg: Path) -> int:
    raw = prg.read_bytes()
    if len(raw) < 2:
        return 0
    return raw[0] | (raw[1] << 8)


def parse_sys_addr_from_bas(bas_path: Path) -> int | None:
    if not bas_path.exists():
        return None
    text = bas_path.read_text(errors="ignore")
    m = re.search(r"sys\s*([0-9]+)", text, flags=re.IGNORECASE)
    if not m:
        return None
    return int(m.group(1))


def generate_build_bat(project_dir: Path, asm_files: list[str]) -> None:
    assemble_lines = []
    if asm_files:
        for asm in asm_files:
            assemble_lines.append(
                f'java -jar "%KICKASS%" "%SCRIPT_DIR%{asm}" -debugdump -debug -symbolfile -odir "%BUILD_DIR%" -o "%BUILD_DIR%\\main.prg"'
            )
            assemble_lines.append("if errorlevel 1 exit /b 1")
    else:
        assemble_lines.append("echo No ASM files found to build.")

    content = "\r\n".join(
        [
            "@echo off",
            "setlocal",
            "set \"SCRIPT_DIR=%~dp0\"",
            "for %%I in (\"%SCRIPT_DIR%..\\..\") do set \"C64_ROOT=%%~fI\"",
            "set \"KICKASS=%C64_ROOT%\\KickAssembler\\KickAss.jar\"",
            "set \"BUILD_DIR=%C64_ROOT%\\build\"",
            "set \"VICE_EXE=%C64_ROOT%\\GTK3VICE-3.10-win64\\bin\\x64sc.exe\"",
            "if not exist \"%BUILD_DIR%\" mkdir \"%BUILD_DIR%\"",
            "echo === Building ===",
            *assemble_lines,
            "echo Build successful: %BUILD_DIR%\\main.prg",
            "if /I \"%~1\"==\"run\" (",
            "  \"%VICE_EXE%\" -autostart \"%BUILD_DIR%\\main.prg\"",
            ")",
            "if /I \"%~1\"==\"debug\" (",
            "  \"%VICE_EXE%\" -moncommands \"%BUILD_DIR%\\main.sym\" -autostart \"%BUILD_DIR%\\main.prg\"",
            ")",
        ]
    ) + "\r\n"
    (project_dir / "build.bat").write_text(content, encoding="utf-8", newline="")


def generate_build_sh(project_dir: Path, asm_files: list[str]) -> None:
    lines = [
        "#!/bin/bash",
        "set -e",
        'SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"',
        'C64_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"',
        'KICKASS="$C64_ROOT/KickAssembler/KickAss.jar"',
        'BUILD_DIR="$C64_ROOT/build"',
        'mkdir -p "$BUILD_DIR"',
    ]
    for asm in asm_files:
        lines.append(
            f'java -jar "$KICKASS" "$SCRIPT_DIR/{asm}" -debugdump -debug -symbolfile -odir "$BUILD_DIR" -o "$BUILD_DIR/main.prg"'
        )
    lines += [
        'if [ "$1" = "run" ]; then',
        '  "$C64_ROOT/GTK3VICE-3.10-win64/bin/x64sc.exe" -autostart "$BUILD_DIR/main.prg"',
        "fi",
        'if [ "$1" = "debug" ]; then',
        '  "$C64_ROOT/GTK3VICE-3.10-win64/bin/x64sc.exe" -moncommands "$BUILD_DIR/main.sym" -autostart "$BUILD_DIR/main.prg"',
        "fi",
    ]
    p = project_dir / "build.sh"
    p.write_text("\n".join(lines) + "\n", encoding="utf-8")
    try:
        p.chmod(0o755)
    except OSError:
        pass


def main() -> None:
    if len(sys.argv) < 2:
        print("Usage: d64toasm.py <image.d64> [project_name]")
        raise SystemExit(1)

    script_dir = Path(__file__).resolve().parent
    root = script_dir.parent

    image = Path(sys.argv[1]).resolve()
    if not image.exists() or image.suffix.lower() != ".d64":
        die("please provide an existing .d64 image")

    project_name = (
        sys.argv[2]
        if len(sys.argv) >= 3
        else re.sub(r"[^a-z0-9_]", "", image.stem.lower().replace(" ", "_"))
    )
    if not project_name:
        die("invalid project name")

    project_dir = root / "projects" / project_name
    project_dir.mkdir(parents=True, exist_ok=True)

    vice_bin = root / "GTK3VICE-3.10-win64" / "bin"
    c1541 = vice_bin / "c1541.exe"
    petcat = vice_bin / "petcat.exe"
    if not c1541.exists():
        c1541 = vice_bin / "c1541"
    if not petcat.exists():
        petcat = vice_bin / "petcat"

    if not c1541.exists():
        die(f"c1541 not found: {vice_bin}")

    listed = run_capture([str(c1541), "-attach", str(image), "-list"])
    if listed.returncode != 0:
        die(listed.stderr.strip() or listed.stdout.strip() or "failed to list disk")

    prg_names = parse_directory_listing(listed.stdout)
    if not prg_names:
        die("no PRG files found in image")

    asm_files: list[str] = []
    for disk_name in prg_names:
        stem = safe_name(disk_name)
        prg_path = project_dir / f"{stem}.prg"
        asm_path = project_dir / f"{stem}.asm"
        bas_path = project_dir / f"{stem}.bas"

        run_capture([str(c1541), "-attach", str(image), "-read", disk_name, str(prg_path)])
        if not prg_path.exists() or prg_path.stat().st_size == 0:
            print(f"Skipping unreadable PRG: {disk_name}")
            continue

        load = read_load_address(prg_path)
        sys_addr = None
        if load == 0x0801 and petcat.exists():
            run_capture([str(petcat), "-2", "-o", str(bas_path), "--", str(prg_path)])
            sys_addr = parse_sys_addr_from_bas(bas_path)

        cmd = [sys.executable, str(script_dir / "disasm.py"), str(prg_path), "--asm"]
        if sys_addr is not None:
            cmd += ["--sys", f"{sys_addr:04X}"]
        dis = run_capture(cmd)
        if dis.returncode != 0:
            print(f"Disassembly failed: {disk_name}")
            continue

        asm_path.write_text(dis.stdout, encoding="utf-8")
        run_capture([sys.executable, str(script_dir / "format_asm.py"), str(asm_path)])
        asm_files.append(asm_path.name)

    generate_build_sh(project_dir, asm_files)
    generate_build_bat(project_dir, asm_files)

    if asm_files:
        rel = f"projects/{project_name}/{asm_files[0]}"
        subprocess.run([sys.executable, str(script_dir / "set_active_project.py"), str(root), rel])

    # Keep a copy of the source disk for reference.
    shutil.copy2(image, project_dir / image.name)

    print(f"Created/updated project: {project_dir}")
    print("Windows build command:")
    print(f"  {project_dir / 'build.bat'}")


if __name__ == "__main__":
    main()
