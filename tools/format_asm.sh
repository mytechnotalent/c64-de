#!/bin/bash
# Format a KickAssembler .asm file using the Python formatter.
# Usage: ./format_asm.sh <file.asm>

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
python3 "$SCRIPT_DIR/format_asm.py" "$@"
