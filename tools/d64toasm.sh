#!/bin/bash
# =============================================================
# d64toasm.sh - Convert a D64 disk image into a
#               KickAssembler C64 project.
#
# Usage:
#   ./d64toasm.sh <file.d64> [project_name]
#
# Creates:  projects/<name>/
#             *.asm       KickAssembler source (one per ML PRG)
#             *.bas       petcat BASIC listing (BASIC PRGs only)
#             *.prg       Original extracted binaries
#             build.sh    Assemble + run in VICE (x64sc)
#             build/      Assembled output
#
# Requires: c1541, petcat (VICE tools), python3,
#           disasm.py and format_asm.py in the same tools/ dir
# Format:   D64 (standard 1541 disk image)
# =============================================================
set -euo pipefail

# ---- Runtime paths resolved once relative to this script ----
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
C64_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DISASM="$SCRIPT_DIR/disasm.py"
FORMAT_ASM="$SCRIPT_DIR/format_asm.py"
PROJECTS_DIR="$C64_ROOT/projects"

# ---- VICE binary directory: ARM64 vs x86-64 Mac ----
if [[ "$(uname -m)" == "arm64" ]]; then
    VICE_BIN="$C64_ROOT/vice-arm64-sdl2-3.10/bin"
else
    VICE_BIN="$C64_ROOT/vice-x86-64-sdl2-3.10/bin"
fi
C1541="$VICE_BIN/c1541"
PETCAT="$VICE_BIN/petcat"

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
# _resolve_image IMAGE
# Validates IMAGE exists and has a .d64 extension, then sets
# IMAGE_ABS (absolute path).
# -------------------------------------------------------------
_resolve_image() {
    [ -f "$1" ] || die "file not found: $1"
    IMAGE_ABS="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
    [[ "$IMAGE_ABS" =~ \.[dD]64$ ]] || die "only D64 images are supported: $1"
}

# -------------------------------------------------------------
# _resolve_project [NAME]
# Derives PROJECT_NAME from the optional override argument or
# from IMAGE_ABS, then sets PROJECT_DIR.
# -------------------------------------------------------------
_resolve_project() {
    if [ -n "${1:-}" ]; then
        PROJECT_NAME="$1"
    else
        PROJECT_NAME=$(basename "$IMAGE_ABS" \
            | sed 's/\.[dD]64$//' \
            | tr '[:upper:]' '[:lower:]' \
            | tr ' ' '_')
    fi
    PROJECT_DIR="$PROJECTS_DIR/$PROJECT_NAME"
}

# -------------------------------------------------------------
# parse_args "$@"
# Validates argument count, resolves the image path and project
# name, warns if the project directory already exists, and
# creates it.
# -------------------------------------------------------------
parse_args() {
    [ $# -ge 1 ] || { echo "Usage: $0 <image.d64> [name]"; exit 1; }
    _resolve_image "$1"
    _resolve_project "${2:-}"
    [ -d "$PROJECT_DIR" ] && echo -e "${YELLOW}Warning: project exists. Files may be overwritten.${NC}"
    mkdir -p "$PROJECT_DIR"
}

# =============================================================
# Step 1: List image contents
# =============================================================

# -------------------------------------------------------------
# list_image_files
# Uses c1541 to read the D64 directory and sets RAW_LIST to a
# newline-separated list of PRG entries.  Exits if none found.
# Uses IMAGE_ABS (set by parse_args).
# -------------------------------------------------------------
list_image_files() {
    echo -e "${CYAN}[1/3] Reading image directory...${NC}"
    RAW_LIST=$("$C1541" -attach "$IMAGE_ABS" -list 2>&1 | grep -i " prg " || true)
    [ -n "$RAW_LIST" ] || die "No PRG files found in image."
    echo "$RAW_LIST" && echo ""
}

# =============================================================
# Step 2: Extract and disassemble PRG files
# =============================================================

# -------------------------------------------------------------
# _parse_entry_name LINE
# Extracts FILE_NAME and SAFE_NAME from a directory listing
# line and sets the expected PRG_PATH, ASM_PATH, BAS_PATH
# globals.  Returns 1 if no filename is found in the line.
# -------------------------------------------------------------
_parse_entry_name() {
    FILE_NAME=$(echo "$1" | sed -n 's/.*"\(.*\)".*/\1/p' | tr '[:upper:]' '[:lower:]')
    [ -n "$FILE_NAME" ] || return 1
    SAFE_NAME=$(echo "$FILE_NAME" | tr ' +.' '_' | tr -s '_' | sed 's/^_//;s/_$//')
    PRG_PATH="$PROJECT_DIR/${SAFE_NAME}.prg"
    ASM_PATH="$PROJECT_DIR/${SAFE_NAME}.asm"
    BAS_PATH="$PROJECT_DIR/${SAFE_NAME}.bas"
}

# -------------------------------------------------------------
# _extract_prg FILE_NAME PRG_PATH
# Uses c1541 to extract a single named PRG from the D64 into
# PRG_PATH.  Prints OK/FAILED and returns 1 on empty output.
# -------------------------------------------------------------
_extract_prg() {
    echo -n "  \"$1\" -> $(basename "$2") ... "
    "$C1541" -attach "$IMAGE_ABS" -read "$1" "$2" 2>/dev/null || true
    [ -s "$2" ] || { echo -e "${RED}FAILED${NC}"; return 1; }
    echo -e "${GREEN}OK${NC}"
}

# -------------------------------------------------------------
# _get_load_address PRG_PATH
# Reads the 2-byte load-address header from PRG_PATH and sets
# LOAD_HEX to a 4-digit uppercase hex string (e.g. "0801").
# -------------------------------------------------------------
_get_load_address() {
    local b0 b1
    b0=$(xxd -p -l1 -s0 "$1" | tr -d '\n')
    b1=$(xxd -p -l1 -s1 "$1" | tr -d '\n')
    LOAD_HEX=$(python3 -c "print(f'{int(\"$b1\",16)<<8 | int(\"$b0\",16):04X}')")
}

# -------------------------------------------------------------
# _decompile_basic PRG_PATH BAS_PATH SAFE_NAME
# Runs petcat to produce a human-readable BASIC listing and
# prints a confirmation line.
# -------------------------------------------------------------
_decompile_basic() {
    "$PETCAT" -2 -o "$2" -- "$1" 2>/dev/null || true
    echo -e "    -> $(basename "$2")  ${CYAN}(BASIC)${NC}"
}

# -------------------------------------------------------------
# _generate_sys_stub LOAD_HEX
# Prints a KickAssembler BASIC SYS stub that jumps to the given
# hex load address.  Emitted before the main code when the PRG
# loads above $0801 (machine-language program with no BASIC).
# -------------------------------------------------------------
_generate_sys_stub() {
    local load_dec
    load_dec=$(python3 -c "print(int('$1',16))")
    cat <<'STUB'
// BASIC SYS stub so VICE autostart can launch the program
*=$0801
	.byte $0c, $08       // Pointer to next BASIC line ($080C)
	.byte $0a, $00       // Line number 10
	.byte $9e            // BASIC token for SYS
STUB
    printf '\t.text "%s"         // SYS %s ($%s)\n' "$load_dec" "$load_dec" "$1"
    cat <<'STUB'
	.byte $00            // End of BASIC line
	.byte $00, $00       // End of BASIC program

STUB
}

# -------------------------------------------------------------
# _disassemble_prg PRG_PATH ASM_PATH SAFE_NAME
# Runs disasm.py (--asm mode) then format_asm.py on PRG_PATH,
# writes output to ASM_PATH, then prints the line count and
# load address.  Prepends a BASIC SYS stub for ML programs that
# load above $0801.
# -------------------------------------------------------------
_disassemble_prg() {
    python3 "$DISASM" "$1" --asm > "$2" 2>/dev/null || true
    # Prepend a BASIC SYS stub for ML programs loading above $0801
    if [ "$LOAD_HEX" != "0801" ]; then
        local tmp_stub; tmp_stub=$(mktemp)
        _generate_sys_stub "$LOAD_HEX" > "$tmp_stub"
        cat "$2" >> "$tmp_stub"
        mv "$tmp_stub" "$2"
    fi
    python3 "$FORMAT_ASM" "$2" 2>/dev/null || true
    local lines
    lines=$(wc -l < "$2" | tr -d ' ')
    echo -e "    -> $(basename "$2")  ${CYAN}($lines lines, load \$$LOAD_HEX)${NC}"
}

# -------------------------------------------------------------
# _register_ml_file ASM_FILE DISK_NAME PRG_PATH
# Appends ASM_FILE to ML_FILES and DISK_NAME to ML_DISK_NAMES.
# Sets MAIN_PRG to the first ML PRG encountered.
# -------------------------------------------------------------
_register_ml_file() {
    ML_FILES+=("$1")
    ML_DISK_NAMES+=("$2")
    [ -n "$MAIN_PRG" ] || MAIN_PRG="$(basename "${3%.prg}").prg"
}

# -------------------------------------------------------------
# _classify_and_process
# Determines PRG type by load address, decompiles BASIC if
# present, then disassembles and registers the ML entry.
# Uses globals: FILE_NAME, SAFE_NAME, PRG_PATH, ASM_PATH,
# BAS_PATH (set by _parse_entry_name).
# -------------------------------------------------------------
_classify_and_process() {
    _get_load_address "$PRG_PATH"
    if [ "$LOAD_HEX" = "0801" ]; then _decompile_basic "$PRG_PATH" "$BAS_PATH" "$SAFE_NAME"; fi
    _disassemble_prg "$PRG_PATH" "$ASM_PATH" "$SAFE_NAME"
    _register_ml_file "${SAFE_NAME}.asm" "$FILE_NAME" "$PRG_PATH"
}

# -------------------------------------------------------------
# _process_entry LINE
# Parses one directory listing entry, extracts its PRG,
# classifies it as BASIC or ML, disassembles it, and registers
# it in the ML_FILES tracking arrays.
# -------------------------------------------------------------
_process_entry() {
    _parse_entry_name "$1" || return 0
    _extract_prg "$FILE_NAME" "$PRG_PATH" || return 0
    _classify_and_process
}

# -------------------------------------------------------------
# extract_files
# Iterates RAW_LIST, calling _process_entry for each line.
# Initialises ML_FILES, ML_DISK_NAMES, and MAIN_PRG.
# -------------------------------------------------------------
extract_files() {
    echo -e "${CYAN}[2/3] Extracting PRG files...${NC}"
    ML_FILES=()
    ML_DISK_NAMES=()
    MAIN_PRG=""
    while IFS= read -r line; do
        _process_entry "$line" || true
    done <<< "$RAW_LIST"
    echo ""
}

# =============================================================
# Step 3: Generate build.sh
# =============================================================

# -------------------------------------------------------------
# _resolve_debug_sym
# Sets DEBUG_SYM_BASE to the last ML file's base name (the
# game binary, not the loader) for the VICE -moncommands flag.
# -------------------------------------------------------------
_resolve_debug_sym() {
    local last_idx=$(( ${#ML_FILES[@]} - 1 ))
    DEBUG_SYM_BASE="${ML_FILES[$last_idx]%.asm}"
    [ -n "$DEBUG_SYM_BASE" ] || DEBUG_SYM_BASE="${MAIN_BUILD_PRG%.prg}"
}

# -------------------------------------------------------------
# _resolve_build_targets
# Sets MAIN_BUILD_PRG, MAIN_OUTPUT, D64_AUTOSTART (defaulting
# to the primary PRG path), and DEBUG_SYM_BASE.
# -------------------------------------------------------------
_resolve_build_targets() {
    MAIN_BUILD_PRG="${MAIN_PRG:-$(cd "$PROJECT_DIR" && ls *.prg 2>/dev/null | head -1)}"
    MAIN_OUTPUT="\$BUILD_DIR/main.prg"
    D64_AUTOSTART="\$BUILD_DIR/main.prg"
    _resolve_debug_sym
}

# -------------------------------------------------------------
# _ml_asm_entry ASM_FILE
# Appends to ASM_BUILD_LINES the KickAssembler invocation for
# a single ASM_FILE, with error handling.
# -------------------------------------------------------------
_ml_asm_entry() {
    local base="${1%.asm}"
    ASM_BUILD_LINES+="
    echo -e \"\${CYAN}  Assembling $1...\${NC}\"
    if ! java -jar \"\$KICKASS\" \"\$SCRIPT_DIR/$1\" -debugdump -debug -symbolfile -o \"\$BUILD_DIR/main.prg\"; then
        echo -e \"\${RED}FAILED: $1\${NC}\"
        exit 1
    fi"
}

# -------------------------------------------------------------
# _build_asm_block
# Sets ASM_BUILD_LINES to the full assembly step for all files
# in ML_FILES, or a simple copy command for BASIC-only projects.
# -------------------------------------------------------------
_build_asm_block() {
    ASM_BUILD_LINES=""
    if [ ${#ML_FILES[@]} -eq 0 ]; then
        ASM_BUILD_LINES="
    echo -e \"\${CYAN}  Copying $MAIN_BUILD_PRG to build/...\${NC}\"
    cp \"\$SCRIPT_DIR/$MAIN_BUILD_PRG\" \"\$BUILD_DIR/$MAIN_BUILD_PRG\""
        return
    fi
    for asm_file in "${ML_FILES[@]}"; do
        _ml_asm_entry "$asm_file"
    done
}

# -------------------------------------------------------------
# _build_inject_cmds
# Prints one c1541 delete+write command per ML file, using each
# file's original disk filename to replace it in the D64 copy.
# -------------------------------------------------------------
_build_inject_cmds() {
    local idx base disk_name
    for idx in "${!ML_FILES[@]}"; do
        base="${ML_FILES[$idx]%.asm}"
        disk_name="${ML_DISK_NAMES[$idx]}"
        printf '    "$C1541" -attach "$TEST_D64" -delete "%s" -write "$BUILD_DIR/main.prg" "%s" > /dev/null 2>&1\n' \
            "$disk_name" "$disk_name"
    done
}

# -------------------------------------------------------------
# _inject_func_body D64_BASENAME
# Prints the complete _build_test_d64() shell function body
# that copies the original D64 and injects each rebuilt PRG.
# -------------------------------------------------------------
_inject_func_body() {
    printf 'C1541="$VICE_DIR/bin/c1541"\n'
    printf 'ORIG_D64="$SCRIPT_DIR/%s"\n' "$1"
    printf 'TEST_D64="$BUILD_DIR/test.d64"\n\n'
    printf '_build_test_d64() {\n'
    printf '    cp "$ORIG_D64" "$TEST_D64"\n'
    _build_inject_cmds
    printf '    echo -e "${CYAN}  Injected built PRGs into test.d64${NC}"\n'
    printf '}\n'
}

# -------------------------------------------------------------
# _build_d64_inject_func
# Detects multi-file D64 projects (loader + game).  If found,
# sets USE_D64_INJECT=true, copies the original disk image into
# the project, builds D64_INJECT_FUNC (the _build_test_d64
# function body), and updates D64_AUTOSTART.
# -------------------------------------------------------------
_build_d64_inject_func() {
    USE_D64_INJECT=false
    D64_INJECT_FUNC=""
    [ ${#ML_FILES[@]} -ge 2 ] || return 0
    USE_D64_INJECT=true
    local d64_basename; d64_basename=$(basename "$IMAGE_ABS")
    cp "$IMAGE_ABS" "$PROJECT_DIR/$d64_basename" && echo -e "  Copied $d64_basename to project directory"
    D64_INJECT_FUNC="$(_inject_func_body "$d64_basename")"
    D64_AUTOSTART="\$TEST_D64"
}

# -------------------------------------------------------------
# _write_build_script
# Writes the complete generated build.sh to PROJECT_DIR using
# a heredoc that interpolates all computed template variables,
# then makes it executable.
# -------------------------------------------------------------
_write_build_script() {
    cat > "$PROJECT_DIR/build.sh" << BUILDSCRIPT
#!/bin/bash
# ---------------------------------------------------------
# build.sh for $PROJECT_NAME
# Auto-generated by d64toasm.sh from $(basename "$IMAGE_ABS")
#
# Usage:
#   ./build.sh          Build only
#   ./build.sh run      Build and launch in VICE (x64sc)
#   ./build.sh debug    Build and launch with debug symbols
# ---------------------------------------------------------
set -e

SCRIPT_DIR="\$(cd "\$(dirname "\$0")" && pwd)"
C64_ROOT="\$(cd "\$SCRIPT_DIR/../.." && pwd)"
KICKASS="\$C64_ROOT/KickAssembler/KickAss.jar"
BUILD_DIR="\$C64_ROOT/build"

if [[ "\$(uname -m)" == "arm64" ]]; then
    VICE_DIR="\$C64_ROOT/vice-arm64-sdl2-3.10"
else
    VICE_DIR="\$C64_ROOT/vice-x86-64-sdl2-3.10"
fi

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

VICE_CFG="\$HOME/.config/vice/sdl-vicerc"
$D64_INJECT_FUNC
mkdir -p "\$BUILD_DIR"
echo -e "\${CYAN}=== Building: $PROJECT_NAME ===\${NC}"
echo ""
$ASM_BUILD_LINES

echo ""
echo -e "\${GREEN}Build successful!\${NC} -> $MAIN_OUTPUT"

if [ "\$1" = "run" ]; then
    echo ""
    echo -e "\${CYAN}Launching in VICE (x64sc)...\${NC}"
$(if $USE_D64_INJECT; then echo '    _build_test_d64'; fi)
    open -a "\$VICE_DIR/VICE.app" --args --program x64sc -config "\$VICE_CFG" -autostart "$D64_AUTOSTART"
fi

if [ "\$1" = "debug" ]; then
    echo ""
    echo -e "\${CYAN}Launching in VICE with debug symbols...\${NC}"
$(if $USE_D64_INJECT; then echo '    _build_test_d64'; fi)
    SYM_FILE="\$SCRIPT_DIR/${DEBUG_SYM_BASE}.sym"
    open -a "\$VICE_DIR/VICE.app" --args --program x64sc -config "\$VICE_CFG" -moncommands "\$SYM_FILE" -autostart "$D64_AUTOSTART"
    echo -e "\${GREEN}VICE started with labels loaded.\${NC}"
fi
BUILDSCRIPT
    chmod +x "$PROJECT_DIR/build.sh"
    echo -e "  ${GREEN}build.sh created${NC}"
}

# -------------------------------------------------------------
# generate_build_sh
# Orchestrates Step 3: resolves output targets, builds the
# assembly block, detects the D64 inject pattern, then writes
# the complete build.sh into the project directory.
# -------------------------------------------------------------
generate_build_sh() {
    echo -e "${CYAN}[3/3] Generating build.sh...${NC}"
    _resolve_build_targets
    _build_asm_block
    _build_d64_inject_func
    _write_build_script
    echo ""
}

# =============================================================
# Top-level flow
# =============================================================

# -------------------------------------------------------------
# print_header
# Prints the tool banner and the resolved image and project
# directory paths.
# -------------------------------------------------------------
print_header() {
    echo -e "${CYAN}=== D64 -> ASM Project Builder ===${NC}"
    echo -e "Image   : ${YELLOW}$IMAGE_ABS${NC}"
    echo -e "Project : ${YELLOW}$PROJECT_DIR${NC}"
    echo ""
}

# -------------------------------------------------------------
# print_summary
# Prints the final success message and quick-start commands.
# -------------------------------------------------------------
print_summary() {
    echo -e "${GREEN}Done!${NC} Project ready at: $PROJECT_DIR"
    echo ""
    echo "  cd \"$PROJECT_DIR\""
    echo "  ./build.sh        # assemble"
    echo "  ./build.sh run    # assemble + launch in VICE"
    echo ""
    echo "Files:"
    ls -lh "$PROJECT_DIR"
}

# -------------------------------------------------------------
# set_active_project
# Updates project-config.json so VS64 targets the new project,
# clears stale build artifacts if the project changed.
# -------------------------------------------------------------
set_active_project() {
    local main_asm="${ML_FILES[0]:-}"
    [ -n "$main_asm" ] || main_asm="$(cd "$PROJECT_DIR" && ls *.asm 2>/dev/null | head -1)"
    [ -n "$main_asm" ] || { echo -e "${RED}No .asm file to register${NC}"; return 1; }
    local rel_path="projects/$PROJECT_NAME/$main_asm"
    echo -e "${CYAN}[4/5] Setting active project...${NC}"
    python3 "$SCRIPT_DIR/set_active_project.py" "$C64_ROOT" "$rel_path"
}

# -------------------------------------------------------------
# build_for_debug
# Runs KickAssembler to produce build/main.prg and
# build/main.dbg so F5 debug works immediately.
# -------------------------------------------------------------
build_for_debug() {
    local main_asm="${ML_FILES[0]:-}"
    [ -n "$main_asm" ] || main_asm="$(cd "$PROJECT_DIR" && ls *.asm 2>/dev/null | head -1)"
    [ -n "$main_asm" ] || { echo -e "${RED}No .asm file to build${NC}"; return 1; }
    local asm_path="$PROJECT_DIR/$main_asm"
    local build_dir="$C64_ROOT/build"
    local kickass="$C64_ROOT/KickAssembler/KickAss.jar"
    local java_exe="/opt/homebrew/opt/openjdk@21/bin/java"
    mkdir -p "$build_dir"
    echo -e "${CYAN}[5/5] Building for VS64 debug...${NC}"
    if "$java_exe" -jar "$kickass" "$asm_path" \
        -debugdump -debug -symbolfile \
        -odir "$build_dir" \
        -o "$build_dir/main.prg" 2>&1; then
        echo -e "${GREEN}Build OK${NC} -> build/main.prg + build/main.dbg"
    else
        echo -e "${RED}Build failed — debug files not generated.${NC}"
        echo -e "${YELLOW}You can still assemble via the project's build.sh${NC}"
    fi
}

# ---- Execute the pipeline in order ----
parse_args "$@"
print_header
list_image_files
extract_files
generate_build_sh
set_active_project
build_for_debug
print_summary
