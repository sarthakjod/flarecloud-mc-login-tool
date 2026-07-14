@echo off
title FlareCloud Login Tool  ^|  discord.gg/fcop
color 0A
chcp 65001 >nul 2>&1
cls

echo.
echo  ============================================================
echo    FlareCloud Login Tool  ^|  discord.gg/fcop
echo    MC Alts and Tools Community
echo  ============================================================
echo.

:: --- Check Python ---
echo  [1/3] Checking Python...
python --version >nul 2>&1
if errorlevel 1 goto NoPython
goto PythonOk

:NoPython
echo.
echo  ============================================================
echo    [WARNING] Python is NOT installed on this system.
echo  ============================================================
echo.
echo   Python 3.10 or newer is required to run this tool.
echo.
echo   Download Python from:
echo     https://www.python.org/downloads/
echo.
echo   IMPORTANT: During install, tick the box:
echo     [x] Add Python to PATH
echo   Then re-run this batch file.
echo.
echo   Want to open the Python download page now? (Y/N)
set /p PY_DL="  > "
if /i "%PY_DL%"=="Y" start https://www.python.org/downloads/
echo.
pause
exit /b 1

:PythonOk
for /f "tokens=*" %%i in ('python --version 2^>^&1') do set PYVER=%%i
echo    OK - %PYVER%
echo.

:: --- Install Requirements ---
echo  [2/3] Installing requirements (rich, questionary)...
python -m pip install --upgrade --quiet rich questionary >nul 2>&1
if errorlevel 1 goto PipUserFallback
goto PipOk

:PipUserFallback
echo  [WARNING] pip install failed. Trying with --user flag...
python -m pip install --upgrade --quiet --user rich questionary >nul 2>&1
if errorlevel 1 goto PipError
goto PipOk

:PipError
echo.
echo  [ERROR] Could not install requirements. Check your internet connection.
echo.
pause
exit /b 1

:PipOk
echo    OK - rich and questionary are ready.
echo.

:: --- Check Prism Launcher ---
echo  [3/3] Checking Prism Launcher...
set PRISM_EXE=%LOCALAPPDATA%\Programs\PrismLauncher\prismlauncher.exe
set PRISM_FOUND=0

if exist "%PRISM_EXE%" set PRISM_FOUND=1
if exist "C:\Program Files\PrismLauncher\prismlauncher.exe" set PRISM_FOUND=1

if %PRISM_FOUND%==0 goto NoPrism
goto PrismOk

:NoPrism
echo.
echo  ============================================================
echo    [WARNING] Prism Launcher is NOT installed.
echo  ============================================================
echo.
echo   Prism Launcher is a free, open-source Minecraft launcher.
echo   You need it to use MC alts via this tool.
echo.
echo   Download Prism Launcher from:
echo     https://prismlauncher.org/download/
echo.
echo   Install steps:
echo     1. Go to https://prismlauncher.org/download/
echo     2. Download the Windows installer (.exe)
echo     3. Run the installer and follow the steps
echo     4. Re-run this tool after installing
echo.
echo   Want to open the Prism Launcher download page now? (Y/N)
set /p PL_DL="  > "
if /i "%PL_DL%"=="Y" start https://prismlauncher.org/download/
echo.
echo   [discord.gg/fcop] - Need help? Join our community!
echo.
pause
exit /b 1

:PrismOk
echo    OK - Prism Launcher found.
echo.

:: --- Launch Tool ---
echo  ============================================================
echo    All checks passed. Launching FlareCloud Login Tool...
echo    discord.gg/fcop
echo  ============================================================
echo.
timeout /t 1 /nobreak >nul

python "%~dp0mc_token.py"

if errorlevel 1 goto ExecutionError
exit /b 0

:ExecutionError
echo.
echo  ============================================================
echo    [ERROR] The tool exited with an error.
echo    Join discord.gg/fcop for support.
echo  ============================================================
echo.
pause
exit /b 1
