@echo off
color 0a
title Livestreamer and VLC Installer/Updater
SET TP=%~dp0
SET TP=%TP:~0,-1%
set /p "ver=What version of livestreamer do you want to download? (If unsure press enter.): "
set /p "ver=What version of VLC do you want to download? (If unsure press enter.): "
if [%ver%]==[] set ver=1.12.2
if [%vlc%]==[] set vlc=2.2.1
cls
mkdir "%TP%\Programs\Temp">NUL
cls
rmdir /S /Q "%TP%\Programs\livestreamer"2>NUL >NUL
rmdir /S /Q "%TP%\Programs\VLCPortable"2>NUL >NUL
echo Downloading Please Wait...
"%TP%\Programs\wget.exe" -q -b https://github.com/chrippa/livestreamer/releases/download/v%ver%/livestreamer-v%ver%-win32.zip -O "%TP%\Programs\Temp\livestreamer-v%ver%-win32.zip" --no-check-certificate>NUL
"%TP%\Programs\wget.exe" -q -b "http://www.slimboat.com/release/sbt7z_x86.exe" -O "%TP%\Programs\Temp\sbt7z_x86.exe">NUL
"%TP%\Programs\wget.exe" -q "http://sourceforge.net/projects/portableapps/files/VLC Media Player Portable/VLCPortable_%vlc%.paf.exe/download" -O "%TP%\Programs\Temp\VLCPortable_%vlc%.paf.exe">NUL
mkdir "%TP%\Programs">NUL
cls
DEL /Q "%TP%\wget-log*" 2>NUL >NUL
echo Updating Please Wait...
"%TP%\Programs\Temp\VLCPortable_%vlc%.paf.exe" /DESTINATION="%TP%\Programs\"
"%TP%\Programs\temp\sbt7z_x86.exe" -o"%TP%\Twitch" -y
"%TP%\Programs\7za.exe" x "%TP%\Programs\Temp\livestreamer-v%ver%-win32.zip" -o"%TP%\Programs\Temp">NUL
mkdir "%TP%\Programs\livestreamer" 2>NUL >NUL
robocopy "%TP%\Programs\Temp\livestreamer-v%ver%" "%TP%\Programs\livestreamer" /E>NUL
cls
echo Please close the browser.
%TP%\Twitch\SlimBoat\SlimBoat.exe
copy /Y "%TP%\Programs\slimboat.ini" "%TP%\Twitch\SlimBoat\appdata"
rmdir /S /Q "%TP%\Programs\Temp">NUL
DEL /Q "%TP%\wget-log*" 2>NUL >NUL
cls
echo Done.
pause
start /b "" cmd /c del "%TP%\Run First.bat"&exit /b