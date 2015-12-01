@echo off
color 0a
title Automator for Livestreamer by POPCORNrules
SET drive=%~d0
SET TP=%~dp0
SET TP=%TP:~0,-1%
cd %TP%\livestreamer
cls
echo What would you like to Watch?
echo 1. Twitch
echo 2. Youtube
echo 3. Crunchyroll
echo 4. Exit
choice /c:12345
if "%errorlevel%"=="1" goto twitch
if "%errorlevel%"=="2" goto youtube
if "%errorlevel%"=="3" goto crunchyroll
if "%errorlevel%"=="4" goto exit

:twitch
cls
%TP%\Twitch\Twitch.tv.bat
goto end
:youtube
cls
%TP%\Youtube\Youtube.bat
:crunchyroll
cls
%TP%\Crunchyroll\Crunchyroll.bat
:exit
exit