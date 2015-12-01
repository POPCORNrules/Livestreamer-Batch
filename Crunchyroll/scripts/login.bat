@echo off
cls
set /p "user=What is your username?: "
cls
"%TP%\Crunchyroll\scripts\%arch%" -m -p "What is you password?:" pass
set "login=--crunchyroll-username %user% --crunchyroll-password %pass% "
%TP%\Crunchyroll\crunchyroll.bat