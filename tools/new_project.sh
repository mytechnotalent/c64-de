#!/bin/bash
# =============================================================
# new_project.sh - Create a new C64 KickAssembler project
#                  from the TEMPLATE skeleton.
#
# Usage:
#   ./tools/new_project.sh <project_name>
#
# Creates:  projects/<name>/
#             main.asm    Starter KickAssembler source
#             build.sh    Assemble + run in VICE (x64sc)
#
# Also:
#   - Sets the new project as the active VS64 debug target
#   - Runs an initial KickAssembler build so F5 works immediately
#
# Requires: python3, java (OpenJDK 21), KickAssembler
# =============================================================
set -euo pipefail

# ---- Runtime paths resolved once relative to this script ----
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
C64_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECTS_DIR="$C64_ROOT/projects"
TEMPLATE_DIR="$PROJECTS_DIR/TEMPLATE"
KICKASS="$C64_ROOT/KickAssembler/KickAss.jar"
case "$(uname -s)" in
    Darwin)
        if [[ "$(uname -m)" == "arm64" ]]; then
            JAVA_EXE="/opt/homebrew/opt/openjdk@21/bin/java"
        else
            JAVA_EXE="/usr/local/opt/openjdk@21/bin/java"
        fi
        ;;
    *) JAVA_EXE="java" ;;
esac

# ---- Terminal color codes ----
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# =============================================================
# Utility
# =============================================================

# -------------------------------------------------------------
# die MESSAGE
# Prints a red error message to stderr and exits with code 1.
# -------------------------------------------------------------
die() {
    echo -e "${RED}Error: $1${NC}" >&2
    exit 1
}

# =============================================================
# Argument parsing
# =============================================================

# -------------------------------------------------------------
# _show_usage
# Prints usage help and exits with code 1.
# -------------------------------------------------------------
_show_usage() {
    echo "Usage: $0 <project_name>"
    echo ""
    echo "  Example: $0 my_game"
    echo "  Creates: projects/my_game/"
    exit 1
}

# -------------------------------------------------------------
# _normalize_name RAW_NAME
# Lowercases RAW_NAME, replaces spaces and hyphens with
# underscores, strips anything that isn't [a-z0-9_], and sets
# PROJECT_NAME.  Dies if the result is empty.
# -------------------------------------------------------------
_normalize_name() {
    PROJECT_NAME="$(echo "$1" \
        | tr '[:upper:]' '[:lower:]' \
        | tr ' -' '_' \
        | sed 's/[^a-z0-9_]//g')"
    [ -n "$PROJECT_NAME" ] || die "project name '$1' is invalid (nothing left after cleanup)"
}

# -------------------------------------------------------------
# parse_args "$@"
# Validates argument count, normalizes the project name, checks
# that TEMPLATE exists and the target doesn't, then creates the
# project directory.
# -------------------------------------------------------------
parse_args() {
    [ $# -ge 1 ] || _show_usage
    _normalize_name "$1"

    PROJECT_DIR="$PROJECTS_DIR/$PROJECT_NAME"

    [ -d "$TEMPLATE_DIR" ] || die "TEMPLATE not found at $TEMPLATE_DIR"
    [ ! -d "$PROJECT_DIR" ] || die "project '$PROJECT_NAME' already exists at $PROJECT_DIR"

    mkdir -p "$PROJECT_DIR"
}

# =============================================================
# Step 1: Copy TEMPLATE skeleton
# =============================================================

# -------------------------------------------------------------
# copy_template
# Copies main.asm from TEMPLATE into the new project directory.
# -------------------------------------------------------------
copy_template() {
    echo -e "${CYAN}[1/4] Copying TEMPLATE...${NC}"
    cp "$TEMPLATE_DIR/main.asm" "$PROJECT_DIR/main.asm"
    echo -e "  ${GREEN}main.asm${NC}  copied"
}

# =============================================================
# Step 2: Generate build.sh
# =============================================================

# -------------------------------------------------------------
# generate_build_sh
# Writes a self-contained build.sh into the project directory
# that can assemble, run, and debug the project.  Always
# outputs to the workspace-root build/ directory so VS64's
# F5 debug and the CLI build.sh share the same artifacts.
# -------------------------------------------------------------
generate_build_sh() {
    echo -e "${CYAN}[2/4] Generating build.sh...${NC}"
    cat > "$PROJECT_DIR/build.sh" << 'BUILDSCRIPT'
#!/bin/bash
# ---------------------------------------------------------
# build.sh - Assemble, run, or debug this C64 project
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
BUILD_DIR="$C64_ROOT/build"

case "$(uname -s)" in
    Darwin)
        if [[ "$(uname -m)" == "arm64" ]]; then
            VICE_DIR="$C64_ROOT/vice-arm64-gtk3-3.10"
        else
            VICE_DIR="$C64_ROOT/vice-x86-64-gtk3-3.10"
        fi
        ;;
    Linux)
        VICE_DIR=""
        ;;
    MINGW*|MSYS*|CYGWIN*)
        VICE_DIR="$C64_ROOT/GTK3VICE-3.10-win64"
        ;;
esac

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

mkdir -p "$BUILD_DIR"

echo -e "${CYAN}=== Building ===${NC}"
echo ""
echo -e "${CYAN}  Assembling main.asm...${NC}"
if ! java -jar "$KICKASS" "$SCRIPT_DIR/main.asm" \
        -debugdump -debug -symbolfile \
        -o "$BUILD_DIR/main.prg"; then
    echo -e "${RED}FAILED: main.asm${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}Build successful!${NC} -> $BUILD_DIR/main.prg"

if [ "$1" = "run" ]; then
    echo ""
    echo -e "${CYAN}Launching in VICE (x64sc)...${NC}"
    case "$(uname -s)" in
        Darwin) open -a "$VICE_DIR/VICE.app" --args --program x64sc -autostart "$BUILD_DIR/main.prg" ;;
        Linux)  x64sc -autostart "$BUILD_DIR/main.prg" ;;
        *)      "$VICE_DIR/bin/x64sc" -autostart "$BUILD_DIR/main.prg" ;;
    esac
fi

if [ "$1" = "debug" ]; then
    echo ""
    echo -e "${CYAN}Launching in VICE with debug symbols...${NC}"
    SYM_FILE="$BUILD_DIR/main.sym"
    case "$(uname -s)" in
        Darwin) open -a "$VICE_DIR/VICE.app" --args --program x64sc -moncommands "$SYM_FILE" -autostart "$BUILD_DIR/main.prg" ;;
        Linux)  x64sc -moncommands "$SYM_FILE" -autostart "$BUILD_DIR/main.prg" ;;
        *)      "$VICE_DIR/bin/x64sc" -moncommands "$SYM_FILE" -autostart "$BUILD_DIR/main.prg" ;;
    esac
    echo -e "${GREEN}VICE started with labels loaded.${NC}"
fi
BUILDSCRIPT
    chmod +x "$PROJECT_DIR/build.sh"
    echo -e "  ${GREEN}build.sh${NC}  created"
}

# =============================================================
# Step 3: Set active VS64 project
# =============================================================

# -------------------------------------------------------------
# set_active_project
# Updates project-config.json so VS64 targets the new project,
# clears stale build artifacts if the project changed.
# -------------------------------------------------------------
set_active_project() {
    echo -e "${CYAN}[3/4] Setting active project...${NC}"
    python3 "$SCRIPT_DIR/set_active_project.py" \
        "$C64_ROOT" "projects/$PROJECT_NAME/main.asm"
}

# =============================================================
# Step 4: Initial build for VS64 debug
# =============================================================

# -------------------------------------------------------------
# build_for_debug
# Runs KickAssembler to produce build/main.prg and
# build/main.dbg so F5 debug works immediately after project
# creation.
# -------------------------------------------------------------
build_for_debug() {
    local build_dir="$C64_ROOT/build"
    mkdir -p "$build_dir"
    echo -e "${CYAN}[4/4] Building for VS64 debug...${NC}"
    if "$JAVA_EXE" -jar "$KICKASS" "$PROJECT_DIR/main.asm" \
        -debugdump -debug -symbolfile \
        -odir "$build_dir" \
        -o "$build_dir/main.prg" 2>&1; then
        echo -e "  ${GREEN}Build OK${NC} -> build/main.prg"
    else
        echo -e "  ${RED}Build failed${NC}"
    fi
}

# =============================================================
# Top-level flow
# =============================================================

# -------------------------------------------------------------
# print_header
# Prints the tool banner and resolved project paths.
# -------------------------------------------------------------
print_header() {
    echo -e "${CYAN}=== New C64 Project ===${NC}"
    echo -e "Name    : ${YELLOW}$PROJECT_NAME${NC}"
    echo -e "Location: ${YELLOW}$PROJECT_DIR${NC}"
    echo ""
}

# -------------------------------------------------------------
# print_summary
# Prints the final success message and quick-start commands.
# -------------------------------------------------------------
print_summary() {
    echo ""
    echo -e "${GREEN}Done!${NC} Project ready at: $PROJECT_DIR"
    echo ""
    echo "  Open main.asm and press F5 to debug"
    echo "  Or:  cd \"$PROJECT_DIR\" && ./build.sh run"
    echo ""
    echo "Files:"
    ls -lh "$PROJECT_DIR"
}

# ---- Execute the pipeline in order ----
parse_args "$@"
print_header
copy_template
generate_build_sh
set_active_project
build_for_debug
print_summary
