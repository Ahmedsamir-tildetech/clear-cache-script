@echo off
echo ===========================================
echo     Clear Edge Cache
echo ===========================================
echo           DevOps Team
echo ===========================================
pause

set /p choice="Clear Edge cache? (Y/N): "

if /i "%choice%"=="Y" (
    taskkill /F /IM msedge.exe >nul 2>&1

    echo.
    echo Deleting Edge cache...
    rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"
    rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Code Cache"
    rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\GPUCache"

    echo.
    echo  Edge cache cleared!
    echo ===========================================
    echo          DevOps Team
    echo ===========================================
) else (
    echo  Cancelled.
)

pause
