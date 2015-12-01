@echo off
color 0a
title Crunchyroll viewer by POPCORNrules
cd %TP%\Programs\livestreamer
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
set arch=editv32.exe
goto log
:64BIT
set arch=editv64.exe
:log
cls
IF "%login%"=="" (goto before) else (goto after)
:before
echo What would you like to do?
echo 1. Login
echo 2. Watch Crunchyroll Episode.
echo 3. Record Crunchyroll Episode.
echo 4. Record Crunchyroll Episode. (no playback)
echo 5. Exit
choice /c:12345
if "%errorlevel%"=="1" goto login
if "%errorlevel%"=="2" goto watch
if "%errorlevel%"=="3" goto record
if "%errorlevel%"=="4" goto noplay
if "%errorlevel%"=="5" goto exit
:after
echo Logged in as %user%
echo.
echo What would you like to do?
echo 1. Watch Crunchyroll Episode.
echo 2. Record Crunchyroll Episode.
echo 3. Record Crunchyroll Episode. (no playback)
echo 4. Exit
choice /c:1234
if "%errorlevel%"=="1" goto watch
if "%errorlevel%"=="2" goto record
if "%errorlevel%"=="3" goto noplay
if "%errorlevel%"=="4" goto exit


:watch
cls
%TP%\Crunchyroll\scripts\stream.bat
:record
cls
%TP%\Crunchyroll\scripts\name.bat
:noplay
cls
%TP%\Crunchyroll\scripts\noplay.bat
:login
%TP%\Crunchyroll\scripts\login.bat
:exit
exit