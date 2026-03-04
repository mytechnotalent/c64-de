#!/usr/bin/env python3
"""
KickAssembler (.asm) Formatter for C64 development.

Formats 6502 assembly source files with consistent indentation:
  - Labels and section comments at column 0
  - Instructions indented 8 spaces
  - Inline comments aligned to column 40 when possible
  - .const/.var directives kept at column 0
  - Preserves blank lines and block structure

Usage:
    python3 format_asm.py <file.asm>

Formats the file in-place.
"""

import sys
import re
import os

INDENT = "\t"
COMMENT_COL = 50
CONST_EQUALS_COL = 30
TAB_WIDTH = 4


def _read_source_lines(filepath: str) -> list[str]:
    """Read all lines from an assembly source file.

    Args:
        filepath: Absolute or relative path to the .asm file.

    Returns:
        List of raw line strings from the file.
    """
    with open(filepath, "r") as f:
        return f.readlines()


def _is_block_comment(line: str) -> bool:
    """Determine if a line is a full-line comment.

    Args:
        line: A raw or stripped source line.

    Returns:
        True if the stripped line starts with //.
    """
    return line.strip().startswith("//")


def _is_label(line: str) -> bool:
    """Determine if a stripped line is a label definition.

    Matches standard labels ending with colon and KickAssembler
    local labels like !loop: or !done+.

    Args:
        line: A stripped source line to check.

    Returns:
        True if the line is a label definition.
    """
    code_part = line.split("//")[0].strip()
    if code_part.endswith(":"):
        return True
    return bool(re.match(r"^![a-zA-Z_]\w*[:\+\-]?\s*(//.*)?$", code_part))


def _format_block_comment(stripped: str, prev_indent_level: int) -> str:
    """Format a full-line // comment with appropriate indentation.

    Section headers (dash lines or uppercase starts) go to column 0.
    Comments inside indented code blocks get standard indentation.

    Args:
        stripped: The stripped comment line.
        prev_indent_level: 1 if previous context was indented, 0 otherwise.

    Returns:
        The formatted comment line.
    """
    if re.match(r"^//\s*-{5,}", stripped):
        return stripped
    if re.match(r"^//\s*[A-Z]", stripped):
        return stripped
    if prev_indent_level > 0:
        return INDENT + stripped
    return stripped


def _is_macro_or_func_call(line: str) -> bool:
    """Determine if a line is a macro invocation or flow-control directive.

    Matches top-level calls like BasicUpstart2(start) and
    KickAssembler directives .for, .if, .else, and closing braces.

    Args:
        line: A stripped source line.

    Returns:
        True if the line is a macro call or flow-control directive.
    """
    s = line.strip()
    if re.match(r"^[A-Za-z_]\w*\(", s):
        return True
    return s.startswith((".for", ".if", ".else", "}"))


def _is_origin_directive(stripped: str) -> bool:
    """Determine if a line is a KickAssembler origin directive (* = $addr).

    Args:
        stripped: A stripped source line.

    Returns:
        True if the line sets the program counter with * = $xxxx.
    """
    return bool(re.match(r"^\*\s*=\s*\$[0-9a-fA-F]+", stripped))


def _format_origin_directive(stripped: str) -> str:
    """Format an origin directive with no spaces: *=$xxxx.

    Removes all spaces around = and the *, keeping any inline comment.

    Args:
        stripped: The stripped origin directive line.

    Returns:
        The formatted origin line at column 0 with no spaces.
    """
    code, comment = _split_code_comment(stripped)
    # Normalize to *=$XXXX with no spaces
    m = re.match(r"^\*\s*=\s*(\$[0-9a-fA-F]+)", code)
    if m:
        code = "*=" + m.group(1)
    return _align_comment(code, comment)


def _is_passthrough(stripped: str) -> bool:
    """Return True if the line should be emitted as-is (no reformatting).

    Labels, macro calls, and flow-control directives are all passed through
    without indentation or comment alignment changes.

    Args:
        stripped: The stripped source line.

    Returns:
        True when the line must not be reformatted.
    """
    if _is_label(stripped):
        return True
    if _is_macro_or_func_call(stripped):
        return True
    return stripped.startswith((".for", ".if", "}", ".else"))


def _toggle_string_state(
    c: str, in_string: bool, string_char: str | None
) -> tuple[bool, str | None]:
    """Update string-literal tracking state when scanning a character.

    Handles entering and exiting single- and double-quoted strings so
    that // inside string literals is not mistaken for a comment.

    Args:
        c: The current character being scanned.
        in_string: Whether the scanner is currently inside a string.
        string_char: The opening quote character if in_string is True.

    Returns:
        Tuple of (in_string, string_char) reflecting the new state.
    """
    if in_string:
        return (False, None) if c == string_char else (True, string_char)
    if c in ('"', "'"):
        return True, c
    return in_string, string_char


def _find_comment_start(line: str) -> int:
    """Scan a line for the position of an inline // comment, respecting strings.

    Args:
        line: The source line to scan.

    Returns:
        The character index where // begins, or -1 if not found.
    """
    in_string = False
    string_char = None
    for i in range(len(line) - 1):
        in_string, string_char = _toggle_string_state(line[i], in_string, string_char)
        if not in_string and line[i] == "/" and line[i + 1] == "/":
            return i
    return -1


def _split_code_comment(line: str) -> tuple[str, str]:
    """Split a source line into its code portion and inline comment.

    Uses _find_comment_start to locate // outside of string literals.

    Args:
        line: A stripped source line.

    Returns:
        A tuple of (code, comment) where comment includes the //.
    """
    pos = _find_comment_start(line)
    if pos >= 0:
        return line[:pos].rstrip(), line[pos:]
    return line, ""


def _align_const_equals(code: str) -> str:
    """Pad a .const/.var code portion so '=' sits at CONST_EQUALS_COL.

    Args:
        code: The code portion (no comment) of a .const/.var line.

    Returns:
        The code string with '=' aligned at CONST_EQUALS_COL.
    """
    if "=" not in code:
        return code
    left, right = code.split("=", 1)
    left = left.rstrip()
    right = right.strip()
    padding = max(1, CONST_EQUALS_COL - 1 - len(left))
    return left + " " * padding + "= " + right


def _visual_length(text: str) -> int:
    """Calculate the visual column width of text accounting for tabs.

    Each tab advances the position to the next TAB_WIDTH boundary.

    Args:
        text: The string to measure.

    Returns:
        The visual column width as an integer.
    """
    col = 0
    for c in text:
        col = col + TAB_WIDTH - (col % TAB_WIDTH) if c == "\t" else col + 1
    return col


def _align_comment(code: str, comment: str, col: int = COMMENT_COL) -> str:
    """Combine code and inline comment with aligned spacing.

    Places the comment starting at the given column, using tab-aware
    visual width.  If code exceeds that column, uses a minimum 1-space gap.

    Args:
        code: The formatted code portion of the line.
        comment: The inline comment including the // prefix.
        col: The target column for comments (default COMMENT_COL).

    Returns:
        The combined line with aligned comment.
    """
    if not comment:
        return code
    padding = max(1, col - 1 - _visual_length(code))
    return code + " " * padding + comment


def _format_const_directive(stripped: str) -> str:
    """Format a .const or .var directive with aligned = and comments.

    Aligns the equals sign at CONST_EQUALS_COL and any inline comment
    at COMMENT_COL.

    Args:
        stripped: The stripped directive line.

    Returns:
        The formatted constant line.
    """
    code, comment = _split_code_comment(stripped)
    return _align_comment(_align_const_equals(code), comment)


def _format_data_directive(stripped: str) -> str:
    """Format .byte, .word, .text, .fill, .encoding directives.

    These are indented like instructions with aligned comments.

    Args:
        stripped: The stripped directive line.

    Returns:
        The formatted directive line.
    """
    code, comment = _split_code_comment(stripped)
    return _align_comment(INDENT + code, comment)


def _format_instruction(stripped: str) -> str:
    """Format a regular 6502 instruction line.

    Adds standard indentation and aligns any inline comment.

    Args:
        stripped: The stripped instruction line.

    Returns:
        The formatted instruction line.
    """
    code, comment = _split_code_comment(stripped)
    return _align_comment(INDENT + code, comment)


def _format_line(line: str, prev_indent_level: int = 0) -> str:
    """Format a single line of KickAssembler source.

    Dispatches to the appropriate formatting handler based on
    line type: blank, comment, label, macro, directive, or instruction.

    Args:
        line: The raw source line.
        prev_indent_level: 1 if previous context was indented, 0 otherwise.

    Returns:
        The formatted line string.
    """
    stripped = line.strip()
    if not stripped:
        return ""
    if _is_block_comment(stripped):
        return _format_block_comment(stripped, prev_indent_level)
    if _is_origin_directive(stripped):
        return _format_origin_directive(stripped)
    if _is_passthrough(stripped):
        return stripped
    if stripped.startswith((".const ", ".var ")):
        return _format_const_directive(stripped)
    if re.match(r"^\.(byte|word|text|fill|encoding)\b", stripped):
        return _format_data_directive(stripped)
    return _format_instruction(stripped)


def _compute_indent_tracking(stripped: str) -> bool:
    """Determine if the next line should be considered indented.

    Labels cause the following line to be indented. Constant and
    variable definitions reset indentation. Other non-blank code
    lines maintain indented state.

    Args:
        stripped: The stripped content of the current line.

    Returns:
        True if the next line should be treated as indented.
    """
    if _is_label(stripped) or _is_block_comment(stripped):
        return _is_label(stripped)
    if stripped.startswith((".const", ".var")):
        return False
    return True


def _write_formatted_output(filepath: str, result: list[str]) -> None:
    """Write formatted lines back to the source file.

    Args:
        filepath: Path to the file to overwrite.
        result: List of formatted line strings.
    """
    with open(filepath, "w") as f:
        f.write("\n".join(result) + "\n")
    print(f"Formatted: {filepath}")


def format_file(filepath: str) -> None:
    """Format an entire KickAssembler .asm file in-place.

    Reads all lines, applies formatting rules to each line while
    tracking indentation context, and writes the result back.

    Args:
        filepath: Path to the .asm source file to format.
    """
    lines = _read_source_lines(filepath)
    result = []
    prev_was_indented = False
    for line in lines:
        raw = line.rstrip("\n").rstrip("\r")
        stripped = raw.strip()
        result.append(_format_line(raw, int(prev_was_indented)))
        if stripped:
            prev_was_indented = _compute_indent_tracking(stripped)
    _write_formatted_output(filepath, result)


# --- Script entry point ---
# Validate command-line arguments and invoke the formatter.
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 format_asm.py <file.asm>")
        sys.exit(1)

    filepath = sys.argv[1]
    if not os.path.exists(filepath):
        print(f"Error: File not found: {filepath}")
        sys.exit(1)

    format_file(filepath)
