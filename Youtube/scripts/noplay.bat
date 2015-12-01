@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
color 0a
title Automator for Livestreamer by POPCORNrules
set /p "channel=What is the name of the Twitch Channel you want to Record?: "
cd %TP%\Youtube\scripts
IF [%channel%]==[] for /f "tokens=*" %%a in ('cmd /c paste.exe clip') do set channel=%%a
cd %TP%\Programs\livestreamer
cls
echo Where do you want to save the recording?
echo 1. Desktop
echo 2. My Documents
echo 3. Current Folder
echo 4. Custom
choice /c:1234
if "%errorlevel%"=="1" goto desktop
if "%errorlevel%"=="2" goto folder
if "%errorlevel%"=="3" goto Current
if "%errorlevel%"=="4" goto custom

:desktop
cls
set "save=%USERPROFILE%\desktop"
goto video
:folder
cls
mkdir "%USERPROFILE%\My Documents\Livestreamer"
cls
set "save=%USERPROFILE%\My Documents\Livestreamer"
goto video
:Current
cls
IF NOT EXIST "%TP%\Youtube\%channel%" (
mkdir "%TP%\Youtube\%channel%"
set "save=%TP%\Youtube\%channel%"
) else (
set "save=%TP%\Youtube\%channel%"
)
goto video
:custom
cls
set /p "save=Please type the full directory(e.g. C:\documents): "
IF NOT EXIST "%save%" (
mkdir "%save%"
) else (
goto video
)

:video
livestreamer.exe twitch.tv/%channel%
echo What quality do you want to record at?
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
cls
if not x%channel:http=%==x%channel% (
  echo Should be a stream URL, trying to open %channel%
  livestreamer %channel% %quality% -o "%save%\%channel%_%mydate%_%mytime%.mp4"
)else (
livestreamer.exe twitch.tv/%channel% %quality% -o "%save%\%channel%_%mydate%_%mytime%.mp4"
)

cls
set "svdir=%save%\%channel% %mydate% %mytime%.mp4"
For /f "tokens=1-2 delims=/ " %%a in ('time /t') do (set endtime=%%a%%b)
echo The stream ended at %endtime%
echo Thank you for using my script.
echo The stream is saved in:
echo %svdir%
pause
%TP%\Youtube\Livestreamer.bat