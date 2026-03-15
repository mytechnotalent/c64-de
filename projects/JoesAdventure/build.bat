@echo off
setlocal
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..\..") do set "C64_ROOT=%%~fI"
set "KICKASS=%C64_ROOT%\KickAssembler\KickAss.jar"
set "BUILD_DIR=%C64_ROOT%\build"
set "VICE_EXE=%C64_ROOT%\GTK3VICE-3.10-win64\bin\x64sc.exe"

if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

echo === Building ===
java -jar "%KICKASS%" "%SCRIPT_DIR%main.asm" -debugdump -debug -symbolfile -odir "%BUILD_DIR%" -o "%BUILD_DIR%\main.prg"
if errorlevel 1 (
  echo Build failed.
  exit /b 1
)

echo Build successful: "%BUILD_DIR%\main.prg"

if /I "%~1"=="run" (
  "%VICE_EXE%" -autostart "%BUILD_DIR%\main.prg"
)

if /I "%~1"=="debug" (
  "%VICE_EXE%" -moncommands "%BUILD_DIR%\main.sym" -autostart "%BUILD_DIR%\main.prg"
)
