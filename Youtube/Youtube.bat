@echo off
color 0a
title Automator for Livestreamer by POPCORNrules
cd %TP%\Programs\livestreamer
cls
echo What would you like to do?
echo 1. Watch Youtube.
echo 2. Record Youtube video.
echo 3. Record Youtube video. (no playback)
echo 4. Play Playlist
echo 5. Make Playlist
echo 6. Exit
choice /c:123456
if "%errorlevel%"=="1" goto watch
if "%errorlevel%"=="2" goto record
if "%errorlevel%"=="3" goto noplay
if "%errorlevel%"=="5" goto loop
if "%errorlevel%"=="4" goto playlist
if "%errorlevel%"=="6" goto exit

:watch
cls
%TP%\Youtube\scripts\stream.bat
:record
cls
%TP%\Youtube\scripts\record.bat
:noplay
cls
%TP%\Youtube\scripts\noplay.bat
:loop
cls
%TP%\Youtube\scripts\playlist.bat
:playlist
cls
%TP%\Youtube\scripts\select.bat
:exit
exit