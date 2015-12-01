
color 0a
title Crunchyroll viewer by POPCORNrules
set /p "channel=Copy the URL of the episode then press enter.: "
cd %TP%\Crunchyroll\scripts
IF [%channel%]==[] for /f "tokens=*" %%a in ('cmd /c paste.exe clip') do set channel=%%a
cd %TP%\Programs\livestreamer
cls

:video
livestreamer.exe %channel%
echo What quality do you want to stream at?
echo 1. Low
echo 2. Medium
echo 3. High
echo 4. Best
choice /c:12345
if "%errorlevel%"=="1" goto Low
if "%errorlevel%"=="2" goto mid
if "%errorlevel%"=="3" goto high
if "%errorlevel%"=="4" goto best
goto video


:Low
cls
set quality=low
goto end
:mid
cls
set quality=mid
goto end
:high
cls
set quality=high
goto end
:best
cls
set quality=best
goto end
:end
%TP%\Crunchyroll\scripts\play.bat
)