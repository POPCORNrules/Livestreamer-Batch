@echo off
color 0a
title Automator for Livestreamer by POPCORNrules
SET drive=%~d0
cd %TP%\Programs\livestreamer
cls
echo What would you like to do?
echo 1. Watch Twitch livestream.
echo 2. Record livestream.
echo 3. Record livestream. (no playback)
echo 4. Loop
echo 5. Exit
choice /c:12345
if "%errorlevel%"=="1" goto watch
if "%errorlevel%"=="2" goto record
if "%errorlevel%"=="3" goto noplay
if "%errorlevel%"=="4" goto loop
if "%errorlevel%"=="5" goto exit

:watch
cls
%TP%\Twitch\scripts\stream.bat
:record
cls
%TP%\Twitch\scripts\record.bat
:noplay
cls
%TP%\Twitch\scripts\noplay.bat
:loop
cls
%TP%\Twitch\scripts\loop.bat
:exit
exit