![image](https://github.com/mytechnotalent/c64-de/blob/main/c64-de.png?raw=true)

## FREE Reverse Engineering Self-Study Course [HERE](https://github.com/mytechnotalent/Reverse-Engineering-Tutorial)

<br>

# Today's Tutorial [March 7, 2026]
## Lesson 125: x64 Course (Part 5 - Binary Addition)
This tutorial will discuss binary addition.

-> Click [HERE](https://0xinfection.github.io/reversing) to read the FREE ebook.

<br>

# C64 Development Environment

A hardcore cross-platform development environment to forge and reverse engineer C-64 legends and develop new ones with pure 6502 Assembler.

Supports **macOS** (Apple Silicon & Intel), **Windows** (64-bit), and **Ubuntu Linux**.

## Quick Setup

VICE (GTK3) and KickAssembler are bundled in the repo. All you need is Java and the VS64 extension.

### 1 — Install Java 21 (required by KickAssembler)

**macOS (Apple Silicon & Intel):**
```sh
brew install openjdk@21
```

**Windows:**
```powershell
winget install EclipseAdoptium.Temurin.21.JDK
```
Or download from https://adoptium.net/temurin/releases/?version=21 and install the `.msi`.

**Ubuntu Linux:**
```sh
sudo apt install openjdk-21-jdk
```

> **Java paths by platform:**
> - macOS Apple Silicon: `/opt/homebrew/opt/openjdk@21/bin/java`
> - macOS Intel: `/usr/local/opt/openjdk@21/bin/java`
> - Windows: `C:\Program Files\Eclipse Adoptium\jdk-21...\bin\java.exe` (or on PATH after install)
> - Linux: `/usr/bin/java`

### 2 — Install VICE (Linux only)

On macOS and Windows, VICE GTK3 v3.10 is bundled in the repo. On Linux, install it from the system package manager:

```sh
sudo apt install vice
```

### 3 — Install the VS64 extension

Open VS Code → `Cmd+Shift+X` (macOS) / `Ctrl+Shift+X` (Windows/Linux) → search **VS64** → install `rosc.vs64`.

### 4 — Update `.vscode/settings.json` for your machine

Open `.vscode/settings.json` and set the paths for your platform:

**macOS (Apple Silicon):**
```json
{
    "vs64.kickInstallDir": "${workspaceFolder}/KickAssembler",
    "vs64.javaExecutable": "/opt/homebrew/opt/openjdk@21/bin/java",
    "vs64.viceExecutable": "${workspaceFolder}/vice-arm64-gtk3-3.10/bin/x64sc",
    "vs64.autoBuild": true,
    "vs64.loglevel": 0
}
```

**macOS (Intel):**
```json
{
    "vs64.kickInstallDir": "${workspaceFolder}/KickAssembler",
    "vs64.javaExecutable": "/usr/local/opt/openjdk@21/bin/java",
    "vs64.viceExecutable": "${workspaceFolder}/vice-x86-64-gtk3-3.10/bin/x64sc",
    "vs64.autoBuild": true,
    "vs64.loglevel": 0
}
```

**Windows:**
```json
{
    "vs64.kickInstallDir": "${workspaceFolder}/KickAssembler",
    "vs64.javaExecutable": "java",
    "vs64.viceExecutable": "${workspaceFolder}/GTK3VICE-3.10-win64/bin/x64sc.exe",
    "vs64.autoBuild": true,
    "vs64.loglevel": 0
}
```

**Ubuntu Linux:**
```json
{
    "vs64.kickInstallDir": "${workspaceFolder}/KickAssembler",
    "vs64.javaExecutable": "java",
    "vs64.viceExecutable": "/usr/bin/x64sc",
    "vs64.autoBuild": true,
    "vs64.loglevel": 0
}
```

### 5 — Open the workspace and press F5

Open the `c64-de` folder in VS Code, open any `.asm` file, and press **F5** to build and debug.

## Workflow

There are two ways to create a project:

### New project from scratch

```sh
./tools/new_project.sh my_game
```

Creates `projects/my_game/` from the TEMPLATE skeleton with a starter `main.asm`, generates `build.sh`, sets it as the active VS64 target, and runs an initial build so **F5 works immediately**.

### Reverse engineer a D64 disk image

```sh
./tools/d64toasm.sh game.d64
```

Extracts all PRG files from the disk, disassembles machine language to KickAssembler source, decompiles BASIC loaders, generates `build.sh`, sets the active VS64 target, and builds — all in one command.

Both tools output to the same unified `build/` directory at the workspace root, which is where VS64 expects `main.prg` and `main.dbg` for F5 debugging.

## Tools

| Tool                      | Description                                                              |
| ------------------------- | ------------------------------------------------------------------------ |
| **KickAssembler v5.25**   | 6502 cross-assembler (`KickAssembler/KickAss.jar`) — Java, all platforms |
| **VICE v3.10 (GTK3)**     | C64 emulator — macOS (arm64 + x86-64), Windows, Linux                    |
| **new_project.sh**        | Create a new project from TEMPLATE (`tools/new_project.sh`)              |
| **d64toasm.sh**           | D64 disk image → KickAssembler project (`tools/d64toasm.sh`)             |
| **disasm.py**             | 6502 disassembler — listing or KickAssembler format (`tools/disasm.py`)  |
| **format_asm.py**         | ASM formatter (`tools/format_asm.py`)                                    |
| **set_active_project.py** | Switch the active VS64 debug target (`tools/set_active_project.py`)      |

## Project Structure

```
c64-de/
├── build/                      Compiled output (main.prg, main.dbg) — shared by all projects
├── projects/
│   ├── TEMPLATE/               Skeleton for new projects (main.asm)
│   └── <your_project>/         Your project source (.asm, .prg, build.sh)
├── tools/                      All tooling scripts
├── KickAssembler/              KickAssembler v5.25 (bundled, Java — all platforms)
├── vice-arm64-gtk3-3.10/       VICE GTK3 for macOS Apple Silicon (bundled)
├── vice-x86-64-gtk3-3.10/      VICE GTK3 for macOS Intel (bundled)
├── GTK3VICE-3.10-win64/        VICE GTK3 for Windows 64-bit (bundled)
├── project-config.json         VS64 active project pointer (auto-managed)
└── .vscode/                    VS Code settings, tasks, and launch configs
```

> **Linux:** VICE is installed system-wide via `sudo apt install vice` — no bundled folder needed.

> **`build/` is always at the workspace root.** Both the per-project `build.sh` and VS64's F5 debug write to the same directory. There are no per-project `build/` folders.

## D64 Reverse Engineering

### Finding D64 Images — Internet Archive

The Internet Archive hosts the largest freely accessible collection of Commodore 64 software:

**https://archive.org/details/softwarelibrary_c64**

> The Commodore 64 is listed in the Guinness World Records as the highest-selling single computer model of all time, with an estimated 10–17 million units sold.

Search by game title, publisher, or year. Download the `.d64` file, drop it in the repo root, then run:

```sh
./tools/d64toasm.sh GameName.d64
```

### d64toasm.sh — Full Pipeline

Converts a `.d64` disk image into a ready-to-edit KickAssembler project:

```sh
# Auto-name the project from the disk filename
./tools/d64toasm.sh game.d64

# Use a custom project name
./tools/d64toasm.sh game.d64 my_project
```

**Pipeline steps:**
1. Read D64 directory and list PRG files
2. Extract each PRG, disassemble ML to `.asm`, decompile BASIC to `.bas`
3. Generate `build.sh` for the project
4. Set the project as the active VS64 target (`project-config.json`)
5. Run KickAssembler to produce `build/main.prg` and `build/main.dbg`

**Creates `projects/<name>/`:**
```
<name>.asm        KickAssembler source (reassemblable, byte-for-byte identical)
<name>.prg        Original extracted binary
<name>.bas        BASIC listing (petcat decompile), if present
build.sh          ./build.sh / ./build.sh run / ./build.sh debug
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

For ML programs loading above `$0801`, `d64toasm.sh` automatically prepends a BASIC SYS stub so VICE can autostart the program.

### Multi-file D64 Projects (loader + game)

When a disk has 2+ ML files (e.g. a BASIC loader that `LOAD`s a separate game file), `d64toasm.sh` automatically:

1. Copies the original D64 into the project
2. Generates a `_build_test_d64()` function in `build.sh` that injects rebuilt PRGs back into the disk
3. Launches VICE with the disk image so the loader runs first

No manual steps — `./build.sh run` handles everything.

### D64 Compatibility

| Situation                        | Works? | Notes                                                                |
| -------------------------------- | ------ | -------------------------------------------------------------------- |
| Single PRG (most games)          | ✅      | Full pipeline                                                        |
| Multiple PRGs per disk           | ✅      | Each file extracted and disassembled separately                      |
| BASIC loader + ML game           | ✅      | BASIC → `.bas`, machine code → `.asm`, disk inject pattern for `run` |
| SEQ / USR files on disk          | ⚠️      | Skipped — only PRG files are processed                               |
| Copy-protected disks             | ❌      | Non-standard sector layout; `c1541` can't read them                  |
| Compressed/packed executables    | ⚠️      | Extracts the packer stub, not the depacked game                      |
| Multi-disk games                 | ⚠️      | Run the script once per disk                                         |
| ML loaded dynamically at runtime | ⚠️      | Only the initial PRG is disassembled                                 |

**Spotting a packed executable:** If the disassembly is very short (< 200 bytes) and ends with `jmp` into a large block of `.byte` data, it's almost certainly a packed binary. You'll need to run it in VICE and dump RAM after it decompresses.

### disasm.py — Standalone Disassembler

```sh
# Annotated listing (address + hex bytes + mnemonic)
python3 tools/disasm.py game.prg

# KickAssembler format, byte-for-byte identical output
python3 tools/disasm.py game.prg --asm > game.asm

# Raw .byte format (legacy, maximum safety)
python3 tools/disasm.py game.prg --kickass > game.asm

# Override load address
python3 tools/disasm.py game.prg 2000 --asm
```

## VS Code Debugging

The workspace includes two debug configurations in `.vscode/launch.json`:

| Configuration                     | Engine              | Description                                      |
| --------------------------------- | ------------------- | ------------------------------------------------ |
| **Debug: built-in 6502 emulator** | VS64 headless 6502  | Fast, no VICE required — breakpoints always work |
| **Debug: VICE (full C64)**        | VICE x64sc via VS64 | Full C64 emulation with SID, VIC, sprites, etc.  |

### How it works

1. Open a `.asm` file
2. Set a breakpoint (click the gutter)
3. Press **F5** — the "Set Active Project" pre-launch task updates `project-config.json`, VS64 builds to `build/main.prg`, and VICE launches
4. Step, inspect registers, view memory — all from VS Code

### Requirements

- **VS64 extension** (`rosc.vs64`) installed
- **`project-config.json`** at the workspace root (auto-managed by `new_project.sh`, `d64toasm.sh`, and the "Set Active Project" task):
  ```json
  {
      "name": "main",
      "toolkit": "kick",
      "sources": ["projects/my_game/main.asm"],
      "build": "debug"
  }
  ```
  > The `name` is always `"main"` so VS64 consistently outputs `build/main.prg` and `build/main.dbg`.

### VICE Dock Icon (macOS)

On macOS, VS64 launches VICE via `bin/x64sc`. The `build.sh` scripts use `open -a VICE.app` so VICE shows with its proper icon in the macOS Dock. On Linux and Windows, VICE is launched directly.

## VS Code Tasks

Run tasks from the menu: **Terminal → Run Task…**

| Task                          | Shortcut      | Description                                     |
| ----------------------------- | ------------- | ----------------------------------------------- |
| **Set Active Project**        | (pre-launch)  | Updates `project-config.json` for the open file |
| **Format ASM**                | —             | Formats the current `.asm` file in-place        |
| **Build C64 Project**         | `Cmd+Shift+B` | Assembles with KickAssembler (default build)    |
| **Build & Run C64 Project**   | —             | Build + launch in VICE                          |
| **Build & Debug C64 Project** | —             | Build + launch VICE with debug symbols          |
| **Build for VS64 Debug**      | —             | Build with `-debugdump` for F5 debugging        |

## Command Line Usage

```sh
# Create a new project from scratch
./tools/new_project.sh my_game

# Reverse engineer a D64 disk image
./tools/d64toasm.sh game.d64

# Format an ASM file
python3 tools/format_asm.py main.asm

# From a project directory:
./build.sh            # Build only
./build.sh run        # Build + launch in VICE
./build.sh debug      # Build + launch with debug symbols
```

## Debugging with VICE Monitor

### Opening the Monitor

Launch with `./build.sh debug` to auto-load all label names from `main.sym`.
Once VICE is running, press **Cmd+Escape** to open the monitor.

### VICE Hotkeys (macOS — use Ctrl instead of Cmd on Windows/Linux)

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

## Formatting Rules

The formatter (`tools/format_asm.py`) applies these conventions:

- **Labels** — column 0, no indentation
- **Instructions** — indented with a tab
- **`.const` / `.var`** — column 0, `=` aligned at column 30
- **Inline comments** — aligned at column 50
- **Section comments** (`// ---`) — column 0
- **Origin directives** (`*=$0801`) — column 0, no spaces around `=`
- **Block comments** inside code — indented with a tab

## License

MIT License

Copyright (c) 2026 Kevin Thomas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
