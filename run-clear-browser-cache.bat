@echo off
echo ===========================================
echo   Clear Browser Cache Launcher
echo ===========================================
echo Choose browser to clear cache:
echo 1. Chrome
echo 2. Firefox
echo 3. Edge
echo ===========================================
set /p choice="Enter 1, 2, or 3: "

if "%choice%"=="1" (
    set SCRIPT_URL=https://raw.githubusercontent.com/Ahmedsamir-tildetech/clear-cache-script/main/clear-chrome-cache.bat
) else if "%choice%"=="2" (
    set SCRIPT_URL=https://raw.githubusercontent.com/Ahmedsamir-tildetech/clear-cache-script/main/clear-firefox-cache.bat
) else if "%choice%"=="3" (
    set SCRIPT_URL=https://raw.githubusercontent.com/Ahmedsamir-tildetech/clear-cache-script/main/clear-edge-cache.bat
) else (
    echo Invalid choice. Exiting...
    pause
    exit /b
)

set TEMP_SCRIPT=%temp%\clear-browser-latest.bat

powershell -Command "try { Invoke-WebRequest -Uri '%SCRIPT_URL%' -OutFile '%TEMP_SCRIPT%' -UseBasicParsing } catch { exit 1 }"

if exist "%TEMP_SCRIPT%" (
    call "%TEMP_SCRIPT%"
    del "%TEMP_SCRIPT%"
) else (
    echo Failed to fetch the latest script.
    pause
)
