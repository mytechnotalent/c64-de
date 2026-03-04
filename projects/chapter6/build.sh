#!/bin/bash

# ---------------------------------------------------------
# build.sh - Assemble and optionally run in VICE
#
# Assembles gameMain.asm which imports shared libraries
# from ../library/ (libMemory, libMath, libScreen, etc.)
#
# Usage:
#   ./build.sh          Build only
#   ./build.sh run      Build and launch in VICE (x64sc)
#   ./build.sh debug    Build and launch with debug symbols
# ---------------------------------------------------------

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
C64_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

KICKASS="$C64_ROOT/KickAssembler/KickAss.jar"

if [[ "$(uname -m)" == "arm64" ]]; then
    VICE_DIR="$C64_ROOT/vice-arm64-sdl2-3.10"
else
    VICE_DIR="$C64_ROOT/vice-x86-64-sdl2-3.10"
fi

SRC="$SCRIPT_DIR/gameMain.asm"
BUILD_DIR="$SCRIPT_DIR/build"
OUTPUT="$BUILD_DIR/main.prg"
SYM_FILE="$SCRIPT_DIR/gameMain.sym"

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}=== C64 Chapter 6 Build ===${NC}"
echo ""

mkdir -p "$BUILD_DIR"

echo -e "${CYAN}Assembling...${NC}"
if java -jar "$KICKASS" "$SRC" -o "$OUTPUT"; then
    echo ""
    echo -e "${GREEN}Build successful!${NC} -> $OUTPUT"
else
    echo -e "${RED}Build FAILED.${NC}"
    exit 1
fi

VICE_CFG="$HOME/.config/vice/sdl-vicerc"

if [ "$1" = "run" ]; then
    echo ""
    echo -e "${CYAN}Launching in VICE (x64sc)...${NC}"
    open -a "$VICE_DIR/VICE.app" --args --program x64sc -config "$VICE_CFG" -autostart "$OUTPUT"
fi

if [ "$1" = "debug" ]; then
    echo ""
    echo -e "${CYAN}Launching in VICE with debug symbols...${NC}"
    open -a "$VICE_DIR/VICE.app" --args --program x64sc -config "$VICE_CFG" -moncommands "$SYM_FILE" -autostart "$OUTPUT"
    echo -e "${GREEN}VICE started with labels loaded.${NC}"
fi
