@echo off
echo ===========================================
echo     Clear Firefox Cache
echo ===========================================
echo           DevOps Team
echo ===========================================
pause

set /p choice="Clear Firefox cache? (Y/N): "
if /i "%choice%"=="Y" (
    taskkill /F /IM firefox.exe >nul 2>&1
    for /d %%d in ("%LocalAppData%\Mozilla\Firefox\Profiles\*") do (
        rd /s /q "%%d\cache2"
    )
    echo Firefox cache cleared!
) else (
    echo Cancelled.
)
pause
