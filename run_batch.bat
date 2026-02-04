@echo off
setlocal EnableDelayedExpansion

:: ========================================================
:: AUTOCAD BATCH RUNNER
:: Runs the transformation script on all .dwg files in the folder.
:: ========================================================

:: 1. SET PATHS
:: Check your AutoCAD version year! (e.g., 2022, 2023, 2024)
set "ACC_PATH=C:\Program Files\Autodesk\AutoCAD 2022\accoreconsole.exe"

:: Use %~dp0 to get the absolute path of the script in the current folder
set "SCRIPT_FILE=%~dp0transform_coordinates.scr"

:: ========================================================
:: VALIDATION
:: ========================================================

echo.
echo --------------------------------------------------------
echo STARTING BATCH PROCESS
echo AutoCAD Console: "%ACC_PATH%"
echo Script File:     "%SCRIPT_FILE%"
echo --------------------------------------------------------
echo.

if not exist "%ACC_PATH%" (
    echo [ERROR] AutoCAD AcCoreConsole not found.
    echo Please verify the path in the .bat file.
    pause
    exit /b
)

if not exist "%SCRIPT_FILE%" (
    echo [ERROR] Script file 'transform_coordinates.scr' not found.
    echo Ensure it is in the same folder as this batch file.
    pause
    exit /b
)

:: ========================================================
:: EXECUTION LOOP
:: ========================================================

:: Delete old log file if exists
if exist process_log.txt del process_log.txt

echo Processing files...
echo (See process_log.txt for details)
echo.

for %%f in (*.dwg) do (
    echo | set /p="> Processing: %%~nxf ... "
    
    :: Run AutoCAD Core Console with the script
    "%ACC_PATH%" /i "%%~ff" /s "%SCRIPT_FILE%" /l en-US >> process_log.txt
    
    echo DONE.
)

echo.
echo --------------------------------------------------------
echo ALL FILES PROCESSED.
echo --------------------------------------------------------
pause
