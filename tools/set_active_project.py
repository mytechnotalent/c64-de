#!/usr/bin/env python3
"""Write project-config.json for the currently active .asm file.

When the active project changes, the stale build.ninja is removed so
VS64 regenerates it for the new source file on the next build/debug.

Usage: set_active_project.py <workspace_root> <relative_asm_path>
"""

import json
import shutil
import sys
from pathlib import Path

workspace = Path(sys.argv[1])
rel_path = sys.argv[2]
config_path = workspace / "project-config.json"
build_dir = workspace / "build"

# Always use "main" as the project name so VS64 consistently
# outputs to build/main.prg and build/main.dbg.  Only the
# sources array changes to point at the active .asm file.
PROJECT_NAME = "main"

# ---- Detect whether the source file actually changed ----
old_sources = None
if config_path.exists():
    try:
        old_sources = json.loads(config_path.read_text()).get("sources")
    except (json.JSONDecodeError, KeyError):
        pass

source_changed = old_sources != [rel_path]

# ---- Write the new project-config.json ----
cfg = {
    "name": PROJECT_NAME,
    "toolkit": "kick",
    "sources": [rel_path],
    "build": "debug",
}
config_path.write_text(json.dumps(cfg, indent=4) + "\n")

# ---- Invalidate stale build artifacts when the source switches ----
if source_changed and build_dir.exists():
    for f in build_dir.iterdir():
        try:
            if f.is_file():
                f.unlink()
        except OSError:
            pass
    print(f"Cleared build/ (source changed to {rel_path})")

print(f"project-config.json → {PROJECT_NAME}  ({rel_path})")
