#!/usr/bin/env python3
"""Write project-config.json for the currently active .asm file.

When the active project changes, stale build artifacts are cleared and
a fresh KickAssembler build is triggered so main.prg and main.dbg are
guaranteed to exist before the VS64 debugger launches.

Usage: set_active_project.py <workspace_root> <relative_asm_path>
"""

import json
import subprocess
import sys
from pathlib import Path

# Always use "main" as the project name so VS64 consistently
# outputs to build/main.prg and build/main.dbg.  Only the
# sources array changes to point at the active .asm file.
PROJECT_NAME = "main"


def _read_old_sources(config_path: Path) -> list[str] | None:
    """Read the previous sources list from project-config.json.

    Args:
        config_path: Path to project-config.json.

    Returns:
        Previous sources list, or None if unreadable.
    """
    if not config_path.exists():
        return None
    try:
        return json.loads(config_path.read_text()).get("sources")
    except (json.JSONDecodeError, KeyError):
        return None


def _write_config(config_path: Path, rel_path: str) -> None:
    """Write the project-config.json with the active source file.

    Args:
        config_path: Path to project-config.json.
        rel_path: Workspace-relative path to the .asm source.
    """
    cfg = {
        "name": PROJECT_NAME,
        "toolkit": "kick",
        "sources": [rel_path],
        "build": "debug",
    }
    config_path.write_text(json.dumps(cfg, indent=4) + "\n")


def _clear_build_dir(build_dir: Path) -> None:
    """Remove all files in the build directory.

    Args:
        build_dir: Path to the build/ directory.
    """
    if not build_dir.exists():
        return
    for f in build_dir.iterdir():
        try:
            if f.is_file():
                f.unlink()
        except OSError:
            pass


def _find_java() -> str:
    """Locate the Java executable from VS Code settings or PATH.

    Returns:
        Absolute path to the java binary.
    """
    settings_path = Path(sys.argv[1]) / ".vscode" / "settings.json"
    if settings_path.exists():
        try:
            s = json.loads(settings_path.read_text())
            java = s.get("vs64.javaExecutable", "")
            if java:
                return java
        except (json.JSONDecodeError, KeyError):
            pass
    return "java"


def _run_kickass(workspace: Path, rel_path: str) -> bool:
    """Run KickAssembler to produce main.prg and main.dbg.

    Args:
        workspace: Workspace root directory.
        rel_path: Workspace-relative path to the .asm source.

    Returns:
        True if the build succeeded, False otherwise.
    """
    java = _find_java()
    jar = workspace / "KickAssembler" / "KickAss.jar"
    src = workspace / rel_path
    build_dir = workspace / "build"
    build_dir.mkdir(exist_ok=True)
    cmd = [
        java,
        "-jar",
        str(jar),
        str(src),
        "-debugdump",
        "-showmem",
        "-symbolfile",
        "-odir",
        str(build_dir),
        "-o",
        str(build_dir / "main.prg"),
    ]
    result = subprocess.run(cmd, cwd=str(src.parent), capture_output=True, text=True)
    if result.returncode == 0:
        print("Build OK → build/main.prg + build/main.dbg")
        return True
    print(f"Build FAILED (exit {result.returncode})")
    if result.stdout:
        print(result.stdout[-500:])
    return False


def main() -> None:
    """Entry point: update config, clear stale build, rebuild if needed."""
    workspace = Path(sys.argv[1])
    rel_path = sys.argv[2]
    config_path = workspace / "project-config.json"
    build_dir = workspace / "build"
    old_sources = _read_old_sources(config_path)
    source_changed = old_sources != [rel_path]
    _write_config(config_path, rel_path)
    if source_changed:
        _clear_build_dir(build_dir)
        print(f"Cleared build/ (source changed to {rel_path})")
        _run_kickass(workspace, rel_path)
    else:
        dbg = build_dir / "main.dbg"
        if not dbg.exists():
            _run_kickass(workspace, rel_path)
    print(f"project-config.json → {PROJECT_NAME}  ({rel_path})")


if __name__ == "__main__":
    main()
