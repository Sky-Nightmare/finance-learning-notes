@echo off
cd /d "%~dp0"

echo ==========================================
echo    Upload notes to GitHub
echo ==========================================
echo.

git add .
git diff --cached --quiet
if %errorlevel%==0 goto NOCHANGE

git commit -m "update notes"
if errorlevel 1 goto COMMITFAIL

git push
if errorlevel 1 goto PUSHFAIL

echo.
echo [OK] Notes uploaded successfully:
echo      https://github.com/Sky-Nightmare/finance-learning-notes
echo.
pause
exit /b

:NOCHANGE
echo [INFO] No changes detected.
echo        Save your note file first, then run this file again.
echo.
pause
exit /b

:COMMITFAIL
echo.
echo [ERROR] Commit failed.
echo         Copy the text above and send it to the assistant.
echo.
pause
exit /b

:PUSHFAIL
echo.
echo [ERROR] Push failed (network problem?).
echo         Wait a few minutes and run this file again.
echo.
pause
exit /b
