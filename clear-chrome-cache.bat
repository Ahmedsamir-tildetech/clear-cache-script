@echo off
echo ===========================================
echo     Clear Chrome Cache
echo ===========================================
echo           DevOps Team
echo ===========================================
pause

set /p choice="Clear Chrome cache? (Y/N): "
if /i "%choice%"=="Y" (
    taskkill /F /IM chrome.exe >nul 2>&1
    rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"
    rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Code Cache"
    rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\GPUCache"
    echo Chrome cache cleared!
) else (
    echo Cancelled.
)
pause
