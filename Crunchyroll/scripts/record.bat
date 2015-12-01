@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
color 0a
title Crunchyroll viewer by POPCORNrules
set /p "channel=Copy the URL of the episode then press enter.: "
cd %TP%\Crunchyroll\scripts
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
set "save=%USERPROFILE%\desktop\%series%"
goto video
:folder
cls
mkdir "%USERPROFILE%\My Documents\Livestreamer\%series%"
cls
set "save=%USERPROFILE%\My Documents\Livestreamer\%series%"
goto video
:Current
cls
IF NOT EXIST "%TP%\Crunchyroll\%series%" (
mkdir "%TP%\Crunchyroll\%series%"
set "save=%TP%\Crunchyroll\%series%"
) else (
set "save=%TP%\Crunchyroll\%series%"
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
cls
start cmd /c %TP%\Crunchyroll\scripts\play.bat
livestreamer %login%%channel% %quality% -o "%save%\%episode%.mp4"

cls
set "svdir=%save%\%episode%.mp4"
For /f "tokens=1-2 delims=/ " %%a in ('time /t') do (set endtime=%%a%%b)
echo The stream ended at %endtime%
echo Thank you for using my script.
echo The stream is saved in:
echo %svdir%
pause