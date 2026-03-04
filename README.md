![image](https://github.com/mytechnotalent/c64-de/blob/main/c64-de.png?raw=true)

## FREE Reverse Engineering Self-Study Course [HERE](https://github.com/mytechnotalent/Reverse-Engineering-Tutorial)

<br>

# C64 Development Environment

A hardcore macOS development environment to forge and reverse engineer C64 legends with and develop new ones with pure 6502 Assembler!

## Quick Setup

VICE and KickAssembler are bundled in the repo. All you need is Java and the VS64 extension.

### 1 — Install Java 21 (required by KickAssembler)

```sh
brew install openjdk@21
```

> **Apple Silicon path:** `/opt/homebrew/opt/openjdk@21/bin/java`  
> **Intel path:** `/usr/local/opt/openjdk@21/bin/java`

### 2 — Install the VS64 extension

Open VS Code → `Cmd+Shift+X` → search **VS64** → install `rosc.vs64`.

### 3 — Update `.vscode/settings.json` for your machine

Open `.vscode/settings.json` and confirm the paths match your Mac:

**Apple Silicon:**
```json
{
    "vs64.kickInstallDir": "/path/to/C64/KickAssembler",
    "vs64.javaExecutable": "/opt/homebrew/opt/openjdk@21/bin/java",
    "vs64.viceExecutable": "/path/to/C64/vice-arm64-sdl2-3.10/bin/x64sc-debug",
    "vs64.autoBuild": true,
    "vs64.loglevel": 0
}
```

**Intel:**
```json
{
    "vs64.kickInstallDir": "/path/to/C64/KickAssembler",
    "vs64.javaExecutable": "/usr/local/opt/openjdk@21/bin/java",
    "vs64.viceExecutable": "/path/to/C64/vice-x86-64-sdl2-3.10/bin/x64sc-debug",
    "vs64.autoBuild": true,
    "vs64.loglevel": 0
}
```

### 4 — Open the workspace and press F5

Open the `C64` folder in VS Code, open any `.asm` file, set a breakpoint, and press **F5** to build and debug.

## Tools

| Tool                    | Description                                                             |
| ----------------------- | ----------------------------------------------------------------------- |
| **KickAssembler v5.25** | 6502 cross-assembler (`KickAssembler/KickAss.jar`)                      |
| **VICE v3.10**          | C64 emulator (`vice-arm64-sdl2-3.10/x64sc.app`)                         |
| **format_asm.py**       | ASM formatter (`tools/format_asm.py`)                                   |
| **d64toasm.sh**         | D64 disk image → KickAssembler project (`tools/d64toasm.sh`)            |
| **disasm.py**           | 6502 disassembler — listing or KickAssembler format (`tools/disasm.py`) |

## Projects

| Project                                 | Description                                                        |
| --------------------------------------- | ------------------------------------------------------------------ |
| `projects/chapter6/`                    | Chapter 6 — multi-file project using shared library                |
| `projects/sprites/`                     | Sprite demo                                                        |
| `projects/forbidden_forest/`            | Forbidden Forest — single-file reverse engineered from D64         |
| `projects/forbidden_forest_1983_cosmi/` | Forbidden Forest (1983, Cosmi) — loader + game, full D64 inject    |
| `projects/content/`                     | Content assets                                                     |
| `projects/library/`                     | Shared KickAssembler library (libMemory, libMath, libScreen, etc.) |

## D64 Reverse Engineering

### Finding D64 Images — Internet Archive

The Internet Archive hosts the largest freely accessible collection of Commodore 64 software:

**https://archive.org/details/softwarelibrary_c64**

> The Commodore 64 is listed in the Guinness World Records as the highest-selling single computer model of all time, with an estimated 10–17 million units sold. The archive preserves thousands of D64 disk images from that era.

Search by game title, publisher, or year. Download the `.d64` file and drop it in the repo root, then run:

```sh
tools/d64toasm.sh  GameName.d64
```

> **Note:** D64 files at the workspace root are gitignored (`*.d64`) to avoid committing copyrighted software.

### d64toasm.sh — Full Pipeline

Converts a `.d64` disk image into a ready-to-edit KickAssembler project with a working `build.sh`:

```sh
# Auto-name the project from the disk filename
tools/d64toasm.sh  game.d64

# Use a custom project name
tools/d64toasm.sh  game.d64  my_project
```

**Creates `projects/<name>/`:**
```
<name>.asm        KickAssembler source (reassemblable, byte-for-byte identical)
<name>.prg        Original extracted binary
<loader>.bas      BASIC loader (petcat decompile), if present
build.sh          ./build.sh / ./build.sh run / ./build.sh debug
build/            Output directory (created on first build)
```

Disassembled output uses real 6502 mnemonics with hardware register annotations:
```asm
    jsr $ffd2                       // $1000
    lda $dc00                       // $100F  ; CIA1_PRA
    and #$1f                        // $1012
    .byte $F0, $F7                  // $1014  beq $100f
    lda $d015                       // $1016  ; VIC_SPEN
```

> Branches and absolute instructions targeting zero-page addresses are emitted as `.byte` to prevent KickAssembler from shrinking them, keeping the output byte-for-byte identical to the original.

### BASIC SYS Stub (auto-generated)

For ML programs loading above `$0801`, `d64toasm.sh` automatically prepends a BASIC SYS stub so VICE can autostart the program. Without this, VICE loads the bytes into memory but drops to `READY.` because there's no `RUN` entry point.

### Multi-file D64 Projects (loader + game)

When a disk has 2 or more ML files (e.g. a BASIC loader that `LOAD`s a separate game file), `d64toasm.sh` automatically:

1. Copies the original D64 into the project as `<name>.d64`
2. Generates a `_build_test_d64()` function in `build.sh` that injects the freshly assembled PRGs back into a copy of the disk
3. Launches VICE with the disk image, so the BASIC loader runs first and finds the game file on disk

No manual steps required — `./build.sh run` handles everything.

### disasm.py — Standalone Disassembler

```sh
# Annotated listing (address + hex bytes + mnemonic)
python3 tools/disasm.py  game.prg

# Real mnemonics — KickAssembler format, byte-for-byte identical output
python3 tools/disasm.py  game.prg  --asm  > game.asm

# Raw .byte format — KickAssembler format (legacy, maximum safety)
python3 tools/disasm.py  game.prg  --kickass  > game.asm

# Override load address
python3 tools/disasm.py  game.prg  2000  --asm
```

### D64 Compatibility

`d64toasm.sh` accepts `.d64` images only and works with the vast majority of standard disk images, but there are real-world limitations:

| Situation                        | Works? | Notes                                                                                    |
| -------------------------------- | ------ | ---------------------------------------------------------------------------------------- |
| Single PRG (most games)          | ✅      | Full pipeline                                                                            |
| Multiple PRGs per disk           | ✅      | Each file extracted and disassembled separately                                          |
| BASIC loader + ML game           | ✅      | BASIC → `.bas`, machine code → `.asm`, disk inject pattern for `run`                     |
| SEQ / USR files on disk          | ⚠️      | Skipped — only PRG files are processed                                                   |
| Copy-protected disks             | ❌      | Non-standard sector layout; `c1541` can't read them                                      |
| Compressed/packed executables    | ⚠️      | Extracts the packer stub, not the depacked game (common with Exomizer, ByteBoozer, etc.) |
| Multi-disk games                 | ⚠️      | Run the script once per disk; disk 2+ may be pure data with no entry point               |
| ML loaded dynamically at runtime | ⚠️      | Only the initial PRG is disassembled; code loaded via custom loaders won't appear        |

**Spotting a packed executable:** If the disassembly is very short (< 200 bytes) and ends with `jmp` into a large block of `.byte` data, it's almost certainly a packed binary. You'll need to run it in VICE and dump RAM after it decompresses.

## VS Code Debugging

The workspace includes two debug configurations in `.vscode/launch.json`:

| Configuration                     | Engine              | Description                                      |
| --------------------------------- | ------------------- | ------------------------------------------------ |
| **Debug: built-in 6502 emulator** | VS64 headless 6502  | Fast, no VICE required — breakpoints always work |
| **Debug: VICE (full C64)**        | VICE x64sc via VS64 | Full C64 emulation with SID, VIC, sprites, etc.  |

### Quick Start

1. Open a `.asm` file (e.g. `projects/forbidden_forest_1983_cosmi/forbidden_game.asm`)
2. Set a breakpoint (click the gutter)
3. Press **F5** or select a configuration from the Run & Debug sidebar
4. Step, inspect registers, view memory — all from VS Code

### Requirements

- **VS64 extension** (`rosc.vs64`) installed in VS Code
- **`project-config.json`** at the workspace root pointing to the `.asm` source:
  ```json
  {
      "name": "forbidden_game",
      "toolkit": "kick",
      "sources": ["projects/forbidden_forest_1983_cosmi/forbidden_game.asm"],
      "build": "debug"
  }
  ```
- **BASIC SYS stub** in the `.asm` file (auto-generated by `d64toasm.sh` for ML programs loading above `$0801`) — required for VICE autostart:
  ```asm
  *=$0801
  	.byte $0c, $08       // Pointer to next BASIC line
  	.byte $0a, $00       // Line number 10
  	.byte $9e            // BASIC token for SYS
  	.text "4096"         // SYS 4096 ($1000)
  	.byte $00            // End of BASIC line
  	.byte $00, $00       // End of BASIC program
  ```

### VICE Dock Icon

VS64 launches VICE via `bin/x64sc-debug`, a wrapper that uses `open -a VICE.app` so VICE shows with its proper icon in the macOS Dock instead of a generic executable icon.

## VS Code Tasks

Run tasks from the menu: **Terminal → Run Task…**

### Format ASM

Formats the currently open `.asm` file with consistent indentation and comment alignment.

1. Open a `.asm` file in the editor
2. Click **Terminal** in the VS Code menu bar
3. Click **Run Task…**
4. Select **Format ASM** from the dropdown
5. The file is reformatted in-place

### Build C64 Project (default build)

Assembles the current project with KickAssembler. This is the **default build task**, so you can also trigger it with **Cmd+Shift+B**.

1. Open any file in a project folder (e.g. `projects/game/main.asm`)
2. Click **Terminal → Run Task…**
3. Select **Build C64 Project**
4. The `.prg` file is written to the project's `build/` folder

### Build & Run C64 Project

Assembles the project and launches it in VICE (x64sc).

1. Open any file in a project folder
2. Click **Terminal → Run Task…**
3. Select **Build & Run C64 Project**
4. The project builds and VICE opens with the `.prg` loaded

## Keyboard Shortcuts

| Shortcut      | Action                                 |
| ------------- | -------------------------------------- |
| `Cmd+Shift+B` | Build C64 Project (default build task) |

## Command Line Usage

From a project directory:

```sh
# Format
python3 ../../tools/format_asm.py main.asm

# Build only
./build.sh

# Build and run in VICE
./build.sh run

# Build and run with debug symbols loaded
./build.sh debug
```

From the `tools/` directory (or using full path):

```sh
# Convert a D64 to a KickAssembler project
tools/d64toasm.sh  path/to/game.d64
tools/d64toasm.sh  path/to/game.d64  my_project_name

# Disassemble a PRG to a listing
python3 tools/disasm.py  game.prg

# Disassemble to reassemblable KickAssembler source (real mnemonics)
python3 tools/disasm.py  game.prg  --asm  > game.asm
```

## Debugging with VICE Monitor

### Opening the Monitor

Launch with `./build.sh debug` to auto-load all label names from `main.sym`.
Once VICE is running, press **Cmd+Escape** to open the monitor.

### VICE macOS Hotkeys

| Shortcut      | Action            |
| ------------- | ----------------- |
| `Cmd+Escape`  | Open monitor      |
| `Cmd+W`       | Toggle warp mode  |
| `Cmd+P`       | Pause / resume    |
| `Cmd+Shift+P` | Advance one frame |
| `Cmd+D`       | Toggle fullscreen |
| `Cmd+F9`      | Reset CPU         |
| `Cmd+Q`       | Quit VICE         |

### Navigation

| Command | What it does                   |
| ------- | ------------------------------ |
| `x`     | Exit monitor, continue running |
| `z`     | Step one instruction           |
| `n`     | Step over (won't enter JSR)    |
| `ret`   | Step out of current subroutine |

### Breakpoints

| Command                | What it does                      |
| ---------------------- | --------------------------------- |
| `break .gameLoop`      | Break at label                    |
| `break $082f`          | Break at hex address              |
| `del 1`                | Delete breakpoint #1              |
| `bk`                   | List all breakpoints              |
| `condition 1 A == $ff` | Conditional breakpoint            |
| `watch load 02`        | Break when address $02 is read    |
| `watch store 07`       | Break when address $07 is written |

### Inspect Memory and Registers

| Command       | What it does                  |
| ------------- | ----------------------------- |
| `r`           | Show all CPU registers        |
| `d .gameLoop` | Disassemble from label        |
| `d 080e 0830` | Disassemble address range     |
| `m 0400 0428` | Hex dump (e.g. screen memory) |
| `m 02 0b`     | Show zero-page game variables |
| `. 02`        | Show single byte at address   |

### Modify Memory

| Command           | What it does                        |
| ----------------- | ----------------------------------- |
| `> 02 14`         | Set byte at $02 to $14 (decimal 20) |
| `> d020 02`       | Set border color to red             |
| `a 080e lda #$05` | Assemble instruction at address     |

### Example Debug Session

```
break .gameLoop          set breakpoint at game loop
x                        continue running until breakpoint
r                        show registers when it stops
m 02 0b                  check all game variables
. 06                     check current speed value
z                        step one instruction
z                        step again
d .readInput             disassemble readInput
n                        step over the next JSR
x                        continue running
```

### Available Labels

All labels from `main.sym` can be used with a `.` prefix:

`.start`, `.gameLoop`, `.readInput`, `.moveLeft`, `.moveRight`,
`.updateBlocks`, `.drawPlayer`, `.drawBlocks`, `.drawScore`,
`.drawFrame`, `.drawTitle`, `.clearPlayfield`, `.initGame`,
`.initBlocks`, `.sfxStart`, `.sfxTick`, `.sfxCrash`, `.sfxUpdate`,
`.sidInit`, `.random`, `.randomColumn`, `.randomRow`,
`.erasePlayer`, `.eraseBlock`, `.splitByte`, `.waitRaster`,
`.scanSpace`, `.showGameOver`, `.drawGameOverMsg`

### Zero-Page Game Variables

| Address | Variable      | Description                 |
| ------- | ------------- | --------------------------- |
| `$02`   | zp_playerCol  | Player column position      |
| `$03`   | zp_score_lo   | Score low byte              |
| `$04`   | zp_score_hi   | Score high byte             |
| `$05`   | zp_frameCount | Frame counter               |
| `$06`   | zp_speed      | Drop speed (lower = faster) |
| `$07`   | zp_gameOver   | Game over flag (0 or 1)     |
| `$08`   | zp_rngState   | RNG state                   |
| `$09`   | zp_temp1      | Temp variable 1             |
| `$0a`   | zp_temp2      | Temp variable 2             |
| `$0b`   | zp_sndTimer   | Sound effect countdown      |

## Formatting Rules

The formatter (`tools/format_asm.py`) applies these conventions:

- **Labels** — column 0, no indentation
- **Instructions** — indented with a tab
- **`.const` / `.var`** — column 0, `=` aligned at column 30
- **Inline comments** — aligned at column 50
- **Section comments** (`// ---`) — column 0
- **Origin directives** (`*=$0801`) — column 0, no spaces around `=`
- **Block comments** inside code — indented with a tab
