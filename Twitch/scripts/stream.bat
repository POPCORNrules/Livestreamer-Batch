color 0a
title Automator for Livestreamer by POPCORNrules
set /p "channel=What is the name of the Twitch Channel you want to view?: "
cd %TP%\Twitch\scripts
IF [%channel%]==[] for /f "tokens=*" %%a in ('cmd /c paste.exe clip') do set channel=%%a
cd %TP%\Programs\livestreamer
cls

:video
livestreamer.exe twitch.tv/%channel%
echo What quality do you want to stream at?
echo 1. Mobile
echo 2. Low
echo 3. Medium
echo 4. High
echo 5. Source
choice /c:12345
if "%errorlevel%"=="1" goto mobile
if "%errorlevel%"=="2" goto low
if "%errorlevel%"=="3" goto medium
if "%errorlevel%"=="4" goto high
if "%errorlevel%"=="5" goto source
goto video


:mobile
cls
set quality=mobile
goto end
:low
cls
set quality=low
goto end
:medium
cls
set quality=medium
goto end
:high
cls
set quality=high
goto end
:source
cls
set quality=source
goto end
:end
%TP%\Twitch\scripts\play.bat
)