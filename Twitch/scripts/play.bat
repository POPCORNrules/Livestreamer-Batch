@echo off
color 0a
title Automator for livestreamer by POPCORNrules
start cmd /c "title Chat&"%TP%\Twitch\SlimBoat\slimboat.exe" "http://www.twitch.tv/chat/embed?channel=%channel%^&popout_chat=true""
livestreamer.exe twitch.tv/%channel% %quality% -p %TP%\programs\VLCPortable\app\vlc\VLC.exe -l none
cls
set "svdir=%save%\%channel% %mydate% %mytime%.mp4"
For /f "tokens=1-2 delims=/ " %%a in ('time /t') do (set endtime=%%a%%b)
echo The stream ended at %endtime%
echo Thank you for using my script.
pause