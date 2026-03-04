#!/usr/bin/env python3
"""Write project-config.json for the currently active .asm file.

Usage: set_active_project.py <workspace_root> <relative_asm_path>
"""

import json
import sys
from pathlib import Path

workspace = sys.argv[1]
rel_path = sys.argv[2]
name = Path(rel_path).stem

cfg = {
    "name": name,
    "toolkit": "kick",
    "sources": [rel_path],
    "build": "debug",
}

out = Path(workspace) / "project-config.json"
out.write_text(json.dumps(cfg, indent=4) + "\n")
print(f"project-config.json → {name}  ({rel_path})")
