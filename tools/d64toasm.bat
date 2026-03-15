@echo off
setlocal
set "SCRIPT_DIR=%~dp0"
python "%SCRIPT_DIR%d64toasm.py" %*
if errorlevel 9009 (
  echo Python is not installed or not on PATH.
  exit /b 1
)
exit /b %errorlevel%
