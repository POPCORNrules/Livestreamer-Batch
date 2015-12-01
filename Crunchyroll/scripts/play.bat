@echo off
color 0a
title Playing %channel%
livestreamer %login%%channel% %quality% -p %TP%\Programs\VLCPortable\app\vlc\VLC.exe
cls
set "svdir=%save%\%channel% %mydate% %mytime%.mp4"
For /f "tokens=1-2 delims=/ " %%a in ('time /t') do (set endtime=%%a%%b)
echo The stream ended at %endtime%
echo Thank you for using my script.