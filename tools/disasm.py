#!/usr/bin/env python3
"""
6502/6510 disassembler for Commodore 64 PRG files.

Usage:
  python3 disasm.py <file.prg>               # listing format (address + hex + mnemonic)
  python3 disasm.py <file.prg> -k            # KickAssembler format (reassemblable)
  python3 disasm.py <file.prg> 1000          # override load address (hex)
  python3 disasm.py <file.prg> 1000 -k       # both
"""

import sys

# Opcode table: maps opcode byte -> (mnemonic, addressing_mode).
# Addressing modes: imp, acc, imm, zp, zpx, zpy, rel, abs, abx, aby, ind, inx, iny
OPCODES = {
    0x00: ("BRK", "imp"),
    0x01: ("ORA", "inx"),
    0x05: ("ORA", "zp"),
    0x06: ("ASL", "zp"),
    0x08: ("PHP", "imp"),
    0x09: ("ORA", "imm"),
    0x0A: ("ASL", "acc"),
    0x0D: ("ORA", "abs"),
    0x0E: ("ASL", "abs"),
    0x10: ("BPL", "rel"),
    0x11: ("ORA", "iny"),
    0x15: ("ORA", "zpx"),
    0x16: ("ASL", "zpx"),
    0x18: ("CLC", "imp"),
    0x19: ("ORA", "aby"),
    0x1D: ("ORA", "abx"),
    0x1E: ("ASL", "abx"),
    0x20: ("JSR", "abs"),
    0x21: ("AND", "inx"),
    0x24: ("BIT", "zp"),
    0x25: ("AND", "zp"),
    0x26: ("ROL", "zp"),
    0x28: ("PLP", "imp"),
    0x29: ("AND", "imm"),
    0x2A: ("ROL", "acc"),
    0x2C: ("BIT", "abs"),
    0x2D: ("AND", "abs"),
    0x2E: ("ROL", "abs"),
    0x30: ("BMI", "rel"),
    0x31: ("AND", "iny"),
    0x35: ("AND", "zpx"),
    0x36: ("ROL", "zpx"),
    0x38: ("SEC", "imp"),
    0x39: ("AND", "aby"),
    0x3D: ("AND", "abx"),
    0x3E: ("ROL", "abx"),
    0x40: ("RTI", "imp"),
    0x41: ("EOR", "inx"),
    0x45: ("EOR", "zp"),
    0x46: ("LSR", "zp"),
    0x48: ("PHA", "imp"),
    0x49: ("EOR", "imm"),
    0x4A: ("LSR", "acc"),
    0x4C: ("JMP", "abs"),
    0x4D: ("EOR", "abs"),
    0x4E: ("LSR", "abs"),
    0x50: ("BVC", "rel"),
    0x51: ("EOR", "iny"),
    0x55: ("EOR", "zpx"),
    0x56: ("LSR", "zpx"),
    0x58: ("CLI", "imp"),
    0x59: ("EOR", "aby"),
    0x5D: ("EOR", "abx"),
    0x5E: ("LSR", "abx"),
    0x60: ("RTS", "imp"),
    0x61: ("ADC", "inx"),
    0x65: ("ADC", "zp"),
    0x66: ("ROR", "zp"),
    0x68: ("PLA", "imp"),
    0x69: ("ADC", "imm"),
    0x6A: ("ROR", "acc"),
    0x6C: ("JMP", "ind"),
    0x6D: ("ADC", "abs"),
    0x6E: ("ROR", "abs"),
    0x70: ("BVS", "rel"),
    0x71: ("ADC", "iny"),
    0x75: ("ADC", "zpx"),
    0x76: ("ROR", "zpx"),
    0x78: ("SEI", "imp"),
    0x79: ("ADC", "aby"),
    0x7D: ("ADC", "abx"),
    0x7E: ("ROR", "abx"),
    0x81: ("STA", "inx"),
    0x84: ("STY", "zp"),
    0x85: ("STA", "zp"),
    0x86: ("STX", "zp"),
    0x88: ("DEY", "imp"),
    0x8A: ("TXA", "imp"),
    0x8C: ("STY", "abs"),
    0x8D: ("STA", "abs"),
    0x8E: ("STX", "abs"),
    0x90: ("BCC", "rel"),
    0x91: ("STA", "iny"),
    0x94: ("STY", "zpx"),
    0x95: ("STA", "zpx"),
    0x96: ("STX", "zpy"),
    0x98: ("TYA", "imp"),
    0x99: ("STA", "aby"),
    0x9A: ("TXS", "imp"),
    0x9D: ("STA", "abx"),
    0xA0: ("LDY", "imm"),
    0xA1: ("LDA", "inx"),
    0xA2: ("LDX", "imm"),
    0xA4: ("LDY", "zp"),
    0xA5: ("LDA", "zp"),
    0xA6: ("LDX", "zp"),
    0xA8: ("TAY", "imp"),
    0xA9: ("LDA", "imm"),
    0xAA: ("TAX", "imp"),
    0xAC: ("LDY", "abs"),
    0xAD: ("LDA", "abs"),
    0xAE: ("LDX", "abs"),
    0xB0: ("BCS", "rel"),
    0xB1: ("LDA", "iny"),
    0xB4: ("LDY", "zpx"),
    0xB5: ("LDA", "zpx"),
    0xB6: ("LDX", "zpy"),
    0xB8: ("CLV", "imp"),
    0xB9: ("LDA", "aby"),
    0xBA: ("TSX", "imp"),
    0xBC: ("LDY", "abx"),
    0xBD: ("LDA", "abx"),
    0xBE: ("LDX", "aby"),
    0xC0: ("CPY", "imm"),
    0xC1: ("CMP", "inx"),
    0xC4: ("CPY", "zp"),
    0xC5: ("CMP", "zp"),
    0xC6: ("DEC", "zp"),
    0xC8: ("INY", "imp"),
    0xC9: ("CMP", "imm"),
    0xCA: ("DEX", "imp"),
    0xCC: ("CPY", "abs"),
    0xCD: ("CMP", "abs"),
    0xCE: ("DEC", "abs"),
    0xD0: ("BNE", "rel"),
    0xD1: ("CMP", "iny"),
    0xD5: ("CMP", "zpx"),
    0xD6: ("DEC", "zpx"),
    0xD8: ("CLD", "imp"),
    0xD9: ("CMP", "aby"),
    0xDD: ("CMP", "abx"),
    0xDE: ("DEC", "abx"),
    0xE0: ("CPX", "imm"),
    0xE1: ("SBC", "inx"),
    0xE4: ("CPX", "zp"),
    0xE5: ("SBC", "zp"),
    0xE6: ("INC", "zp"),
    0xE8: ("INX", "imp"),
    0xE9: ("SBC", "imm"),
    0xEA: ("NOP", "imp"),
    0xEC: ("CPX", "abs"),
    0xED: ("SBC", "abs"),
    0xEE: ("INC", "abs"),
    0xF0: ("BEQ", "rel"),
    0xF1: ("SBC", "iny"),
    0xF5: ("SBC", "zpx"),
    0xF6: ("INC", "zpx"),
    0xF8: ("SED", "imp"),
    0xF9: ("SBC", "aby"),
    0xFD: ("SBC", "abx"),
    0xFE: ("INC", "abx"),
}

# Maps addressing mode name -> total instruction size in bytes (opcode + operands).
MODE_SIZES = {
    "imp": 1,
    "acc": 1,
    "imm": 2,
    "zp": 2,
    "zpx": 2,
    "zpy": 2,
    "rel": 2,
    "abs": 3,
    "abx": 3,
    "aby": 3,
    "ind": 3,
    "inx": 2,
    "iny": 2,
}

# Well-known C64 hardware register addresses mapped to symbolic names.
C64_LABELS = {
    0xD000: "VIC_SP0X",
    0xD001: "VIC_SP0Y",
    0xD002: "VIC_SP1X",
    0xD003: "VIC_SP1Y",
    0xD010: "VIC_SPXMSB",
    0xD011: "VIC_CR1",
    0xD012: "VIC_RASTER",
    0xD015: "VIC_SPEN",
    0xD016: "VIC_CR2",
    0xD017: "VIC_SPYEXP",
    0xD018: "VIC_MEMCFG",
    0xD019: "VIC_IRQ",
    0xD01A: "VIC_IRQEN",
    0xD01B: "VIC_SPPRI",
    0xD01C: "VIC_SPMCOL",
    0xD01D: "VIC_SPXEXP",
    0xD01E: "VIC_SPCOL",
    0xD01F: "VIC_SPBCOL",
    0xD020: "VIC_BORDER",
    0xD021: "VIC_BG0",
    0xD025: "VIC_SPMCOL0",
    0xD026: "VIC_SPMCOL1",
    0xD400: "SID_FR1LO",
    0xD401: "SID_FR1HI",
    0xD402: "SID_PW1LO",
    0xD403: "SID_PW1HI",
    0xD404: "SID_CR1",
    0xD405: "SID_AD1",
    0xD406: "SID_SR1",
    0xD40E: "SID_FLTLO",
    0xD40F: "SID_FLTHI",
    0xD410: "SID_RESVOL",
    0xD418: "SID_FMODE",
    0xDC00: "CIA1_PRA",
    0xDC01: "CIA1_PRB",
    0xDC02: "CIA1_DDRA",
    0xDC03: "CIA1_DDRB",
    0xDC0D: "CIA1_ICR",
    0xDD00: "CIA2_PRA",
    0xDD0D: "CIA2_ICR",
    0xFFFE: "IRQ_VEC_LO",
    0xFFFF: "IRQ_VEC_HI",
}


def _fmt_addr(addr: int, inline_comment: bool = True) -> str:
    """Format an absolute address, optionally appending a hardware label comment.

    Args:
        addr: The 16-bit address value.
        inline_comment: When True, appends '; LABEL' for known C64 registers.

    Returns:
        Address string like '$D020' or '$D020 ; VIC_BORDER'.
    """
    lbl = C64_LABELS.get(addr)
    if lbl and inline_comment:
        return f"${addr:04X} ; {lbl}"
    return f"${addr:04X}"


def _hw_label(mode: str, operand_bytes: bytes) -> str:
    """Return the C64 hardware register name for abs/abx/aby operands.

    Args:
        mode: Addressing mode name.
        operand_bytes: The operand bytes of the instruction.

    Returns:
        Register name string (e.g. 'VIC_BORDER'), or empty string if unknown.
    """
    if mode in ("abs", "abx", "aby") and len(operand_bytes) == 2:
        addr = operand_bytes[0] | (operand_bytes[1] << 8)
        return C64_LABELS.get(addr, "")
    return ""


def _fmt_register_modes(mode: str, data: bytes) -> str | None:
    """Format single-byte and zero-page addressing modes.

    Handles imp, acc, imm, zp, zpx, zpy modes.

    Args:
        mode: Addressing mode name.
        data: Operand bytes (may be empty for imp/acc).

    Returns:
        Formatted operand string, or None if the mode is not handled here.
    """
    if mode in ("imp", "acc"):
        return ""
    if mode == "imm":
        return f"#${data[0]:02X}"
    if mode == "zp":
        return f"${data[0]:02X}"
    if mode == "zpx":
        return f"${data[0]:02X},X"
    if mode == "zpy":
        return f"${data[0]:02X},Y"
    return None


def _fmt_rel(data: bytes, pc: int) -> str:
    """Resolve and format a relative branch target as an absolute address.

    Args:
        data: Operand bytes; data[0] is the signed 8-bit branch offset.
        pc: Program counter at the branch instruction.

    Returns:
        Absolute branch target formatted as '$XXXX'.
    """
    offset = data[0] if data[0] < 128 else data[0] - 256
    return f"${pc + 2 + offset:04X}"


def _fmt_indirect_modes(mode: str, data: bytes) -> str | None:
    """Format indirect and indexed-indirect addressing modes.

    Handles ind, inx, iny modes.

    Args:
        mode: Addressing mode name.
        data: Operand bytes.

    Returns:
        Formatted operand string, or None if the mode is not handled here.
    """
    if mode == "ind":
        return f"(${data[0] | (data[1] << 8):04X})"
    if mode == "inx":
        return f"(${data[0]:02X},X)"
    if mode == "iny":
        return f"(${data[0]:02X}),Y"
    return None


def _fmt_abs_indexed(mode: str, data: bytes, kickass: bool) -> str:
    """Format absolute indexed addressing (abx/aby) with optional hardware label comment.

    Args:
        mode: 'abx' (X-indexed) or 'aby' (Y-indexed).
        data: Two-byte little-endian operand.
        kickass: When True, suppresses inline ';' comments (KickAssembler uses //).

    Returns:
        Formatted operand string like '$D000,X' or '$D000,X ; VIC_SP0X'.
    """
    addr = data[0] | (data[1] << 8)
    suffix = ",X" if mode == "abx" else ",Y"
    lbl = C64_LABELS.get(addr, "")
    comment = f" ; {lbl}" if (lbl and not kickass) else ""
    return f"${addr:04X}{suffix}{comment}"


def _fmt_operand(mode: str, data: bytes, pc: int, kickass: bool = False) -> str:
    """Dispatch operand formatting to the appropriate mode handler.

    Args:
        mode: Addressing mode name.
        data: Operand bytes for this instruction.
        pc: Program counter at this instruction (needed for relative branches).
        kickass: When True, suppresses inline semicolon register comments.

    Returns:
        Formatted operand string (empty string for implied/accumulator modes).
    """
    simple = _fmt_register_modes(mode, data)
    if simple is not None:
        return simple
    indirect = _fmt_indirect_modes(mode, data)
    if indirect is not None:
        return indirect
    if mode == "rel":
        return _fmt_rel(data, pc)
    if mode == "abs":
        return _fmt_addr(data[0] | (data[1] << 8), inline_comment=not kickass)
    if mode in ("abx", "aby"):
        return _fmt_abs_indexed(mode, data, kickass)
    return ""


def _kickass_header(load_addr: int, byte_count: int) -> list[str]:
    """Return the KickAssembler header lines for a disassembly output block.

    Args:
        load_addr: C64 load address for the '*=' directive.
        byte_count: Number of code bytes (informational comment only).

    Returns:
        List of three header strings: comment, origin directive, blank line.
    """
    return [
        f"// Load address: ${load_addr:04X}  ({byte_count} bytes)",
        f"*= ${load_addr:04X}",
        "",
    ]


def _get_raw_bytes(data: bytes, i: int, mode: str) -> bytes:
    """Slice raw instruction bytes from data at offset i for the given mode.

    Args:
        data: Full code buffer.
        i: Current offset into data.
        mode: Addressing mode; determines instruction size via MODE_SIZES.

    Returns:
        Bytes slice covering the full instruction (opcode + operands).
    """
    return data[i : i + MODE_SIZES[mode]]


def _decode_opcode(data: bytes, i: int) -> tuple[str, str] | None:
    """Look up the opcode at data[i] and return its mnemonic and mode.

    Args:
        data: Full code buffer.
        i: Offset of the opcode byte.

    Returns:
        Tuple (mnemonic, mode) or None if the opcode is not in OPCODES.
    """
    return OPCODES.get(data[i])


def _fmt_unknown_byte(opcode: int, pc: int, kickass: bool, asm: bool = False) -> str:
    """Format an unrecognised opcode byte as a .byte directive with comment.

    Args:
        opcode: The unrecognised opcode value.
        pc: Program counter position.
        kickass: Selects KickAssembler vs listing output format.
        asm: Selects KickAssembler mnemonic format (real mnemonics, not .byte).

    Returns:
        Formatted .byte line string.
    """
    if kickass or asm:
        return f"    .byte ${opcode:02X}                    // ${pc:04X}  ???"
    return f"${pc:04X}:  .byte ${opcode:02X}  ; ???"


def _fmt_kickass_line(
    raw_bytes: bytes, pc: int, instr: str, mode: str, operand_bytes: bytes
) -> str:
    """Format one instruction as a KickAssembler .byte directive with comment.

    Emits raw bytes so reassembly is byte-for-byte identical even when data
    regions are misidentified as code.

    Args:
        raw_bytes: All bytes of the instruction (opcode + operands).
        pc: Program counter of this instruction.
        instr: Disassembled instruction text (mnemonic + operand string).
        mode: Addressing mode (used to look up hardware label).
        operand_bytes: Operand bytes only (no opcode).

    Returns:
        Formatted '.byte $XX, ...' line string.
    """
    lbl = _hw_label(mode, operand_bytes)
    byte_list = ", ".join(f"${b:02X}" for b in raw_bytes)
    hw = f"  ({lbl})" if lbl else ""
    return f"    .byte {byte_list:<20} // ${pc:04X}{hw}  {instr.lower()}"


def _fmt_asm_line(pc: int, instr: str, mode: str, operand_bytes: bytes) -> str:
    """Format one instruction as a KickAssembler mnemonic line with comment.

    Outputs real mnemonics (e.g. 'JSR $6000') instead of .byte directives,
    making the output human-readable while still being KickAssembler-compilable.

    Args:
        pc: Program counter of this instruction.
        instr: Disassembled instruction text (mnemonic + operand string).
        mode: Addressing mode (used to look up hardware label).
        operand_bytes: Operand bytes only (no opcode).

    Returns:
        Formatted '    MNEM OPERAND  // $ADDR  label' line string.
    """
    lbl = _hw_label(mode, operand_bytes)
    hw = f"  ; {lbl}" if lbl else ""
    return f"    {instr.lower():<27} // ${pc:04X}{hw}"


def _fmt_listing_line(raw_bytes: bytes, pc: int, instr: str) -> str:
    """Format one instruction as an annotated listing line.

    Args:
        raw_bytes: All bytes for the instruction.
        pc: Program counter of this instruction.
        instr: Disassembled instruction text.

    Returns:
        Formatted '$ADDR:  HH HH   MNEM OPERAND' string.
    """
    hex_bytes = " ".join(f"{b:02X}" for b in raw_bytes)
    return f"${pc:04X}:  {hex_bytes:<9}  {instr}"


def _fmt_instr_line(
    raw_bytes: bytes, pc: int, mnem: str, mode: str, kickass: bool, asm: bool = False
) -> str:
    """Decode operand and format one instruction line in the selected output style.

    Args:
        raw_bytes: All bytes for the instruction (opcode + operands).
        pc: Program counter of this instruction.
        mnem: Mnemonic string (e.g. 'LDA').
        mode: Addressing mode name.
        kickass: True for KickAssembler .byte format; False for listing format.
        asm: True for KickAssembler mnemonic format (real mnemonics, not .byte).

    Returns:
        Formatted instruction line string.
    """
    operand_bytes = raw_bytes[1:]
    operand_str = _fmt_operand(mode, operand_bytes, pc, kickass=(kickass or asm))
    instr = f"{mnem} {operand_str}".strip()
    if asm:
        return _fmt_asm_line(pc, instr, mode, operand_bytes)
    if kickass:
        return _fmt_kickass_line(raw_bytes, pc, instr, mode, operand_bytes)
    return _fmt_listing_line(raw_bytes, pc, instr)


def _disassemble_one(
    data: bytes, i: int, load_addr: int, kickass: bool, asm: bool = False
) -> tuple[str, int]:
    """Disassemble a single instruction at offset i and return line + next offset.

    Args:
        data: Full code buffer.
        i: Current byte offset into data.
        load_addr: Base load address (added to i for program counter).
        kickass: Selects output format.

    Returns:
        Tuple of (formatted line string, new offset after this instruction).
    """
    pc = load_addr + i
    info = _decode_opcode(data, i)
    if info is None:
        return _fmt_unknown_byte(data[i], pc, kickass, asm=asm), i + 1
    mnem, mode = info
    raw_bytes = _get_raw_bytes(data, i, mode)

    # In --asm mode, always emit relative branch instructions as .byte to
    # prevent KickAssembler from re-encoding the offset based on assembled
    # position (data regions misread as code branch to far-away targets).
    if asm and mode == "rel" and len(raw_bytes) == 2:
        off = raw_bytes[1]
        signed_off = off if off < 128 else off - 256
        target = pc + 2 + signed_off
        byte_list = ", ".join(f"${b:02X}" for b in raw_bytes)
        return (
            f"    .byte {byte_list:<20} // ${pc:04X}  {mnem.lower()} ${target:04X}",
            i + 2,
        )

    # In --asm mode, emit absolute-mode instructions that address zero-page
    # ($00-$FF) as .byte — KickAssembler would otherwise silently shrink them
    # from 3-byte absolute to 2-byte zero-page, corrupting all subsequent
    # addresses.
    if asm and mode in ("abs", "abx", "aby") and len(raw_bytes) == 3:
        addr = raw_bytes[1] | (raw_bytes[2] << 8)
        if addr < 0x100:
            byte_list = ", ".join(f"${b:02X}" for b in raw_bytes)
            lbl = _hw_label(mode, raw_bytes[1:])
            hw = f"  ; {lbl}" if lbl else ""
            suffix = ",x" if mode == "abx" else (",y" if mode == "aby" else "")
            return (
                f"    .byte {byte_list:<20} // ${pc:04X}{hw}  {mnem.lower()} ${addr:04X}{suffix}",
                i + 3,
            )

    return (
        _fmt_instr_line(raw_bytes, pc, mnem, mode, kickass, asm=asm),
        i + MODE_SIZES[mode],
    )


def _disassemble(
    data: bytes, load_addr: int, kickass: bool = False, asm: bool = False
) -> list[str]:
    """Disassemble all bytes in data starting at load_addr.

    Args:
        data: Raw code bytes (no load-address header).
        load_addr: C64 address where the data is loaded.
        kickass: True for reassemblable KickAssembler .byte output; False for listing.
        asm: True for KickAssembler mnemonic output (real mnemonics, KickAss header).

    Returns:
        List of formatted output line strings.
    """
    if asm:
        header = [
            f"// Load address: ${load_addr:04X}  ({len(data)} bytes)",
            f"* = ${load_addr:04X}",
            "",
        ]
    elif kickass:
        header = _kickass_header(load_addr, len(data))
    else:
        header = []
    lines = header
    i = 0
    while i < len(data):
        line, i = _disassemble_one(data, i, load_addr, kickass, asm=asm)
        lines.append(line)
    return lines


def _parse_args() -> tuple[str, int | None, bool, bool]:
    """Parse sys.argv and return (path, optional_load_addr, kickass_flag, asm_flag).

    Returns:
        Tuple of (file path, load address override or None, kickass bool, asm bool).

    Raises:
        SystemExit: When no file path is supplied.
    """
    kickass_flags = {"-k", "--kickass"}
    asm_flags = {"-a", "--asm"}
    all_flags = kickass_flags | asm_flags
    kickass = any(a in kickass_flags for a in sys.argv[1:])
    asm = any(a in asm_flags for a in sys.argv[1:])
    args = [a for a in sys.argv[1:] if a not in all_flags]
    if not args:
        print("Usage: disasm.py <file.prg> [load_addr_hex] [-k|--kickass] [-a|--asm]")
        sys.exit(1)
    override = int(args[1], 16) if len(args) >= 2 else None
    return args[0], override, kickass, asm


def _load_prg(path: str, addr_override: int | None) -> tuple[bytes, int]:
    """Read a PRG file and return its code bytes and resolved load address.

    The first two bytes of a PRG file are a little-endian load address which
    may be overridden by addr_override.

    Args:
        path: Path to the .prg file.
        addr_override: Optional explicit load address (overrides file header).

    Returns:
        Tuple of (code bytes without header, load address).
    """
    raw = open(path, "rb").read()
    addr = raw[0] | (raw[1] << 8)
    if addr_override is not None:
        addr = addr_override
    return raw[2:], addr


def _print_listing_header(path: str, load_addr: int, code: bytes) -> None:
    """Print the plain-text listing header to stdout.

    Args:
        path: Source file path shown in the header comment.
        load_addr: Resolved load address.
        code: Code bytes (length shown in the header).
    """
    print(f"; {path}")
    print(f"; Load address: ${load_addr:04X}  ({len(code)} bytes)")
    print("; Disassembly")
    print(";")


def main() -> None:
    """Entry point: parse arguments, load PRG, and print disassembly to stdout."""
    path, addr_override, kickass, asm = _parse_args()
    code, load_addr = _load_prg(path, addr_override)
    if not kickass and not asm:
        _print_listing_header(path, load_addr, code)
    for line in _disassemble(code, load_addr, kickass=kickass, asm=asm):
        print(line)


if __name__ == "__main__":
    main()
