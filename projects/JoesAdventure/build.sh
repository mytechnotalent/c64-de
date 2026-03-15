#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
C64_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
KICKASS="$C64_ROOT/KickAssembler/KickAss.jar"
BUILD_DIR="$C64_ROOT/build"
mkdir -p "$BUILD_DIR"
java -jar "$KICKASS" "$SCRIPT_DIR/main.asm" -debugdump -debug -symbolfile -odir "$BUILD_DIR" -o "$BUILD_DIR/main.prg"

if [ "$1" = "run" ]; then
  case "$(uname -s)" in
    Darwin) VICE="$C64_ROOT/vice-arm64-gtk3-3.10/bin/x64sc" ;;
    Linux) VICE="x64sc" ;;
    *) VICE="$C64_ROOT/GTK3VICE-3.10-win64/bin/x64sc.exe" ;;
  esac
  "$VICE" -autostart "$BUILD_DIR/main.prg"
fi

if [ "$1" = "debug" ]; then
  case "$(uname -s)" in
    Darwin) VICE="$C64_ROOT/vice-arm64-gtk3-3.10/bin/x64sc" ;;
    Linux) VICE="x64sc" ;;
    *) VICE="$C64_ROOT/GTK3VICE-3.10-win64/bin/x64sc.exe" ;;
  esac
  "$VICE" -moncommands "$BUILD_DIR/main.sym" -autostart "$BUILD_DIR/main.prg"
fi
