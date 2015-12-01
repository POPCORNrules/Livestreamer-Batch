
color 0a
cls
set /p "playlist=What do you want to name your playlist: "
set playlist="%TP%\Youtube\playlists\%playlist%"
cls
set playlist=%playlist%.bat
set /p "end=How many videos do you want in your playlist? Type a number. (e.g. 10): "
set /a end=%end%-1
cls
set start=0 
rem replace the number 2 in the next command 
rem with the number of times you wish to loop it.
	set /a endcount=%end%+1
	echo Video 1 out of %endcount%
	echo.
	echo.
	echo Copy the link to the Youtube video and
	pause
	for /f "tokens=*" %%a in ('cmd /c "%TP%\Youtube\scripts\paste.exe" clip') do set video=%%a
	echo %TP%\Youtube\livestreamer\livestramer.exe %video% best -p %TP%\Youtube\VLCPortable\app\vlc\VLC.exe -l none>%playlist%
:loop
if %start%==%end% goto stop
	cls
	set /a count=%start%+2
	echo Video %count% out of %endcount%
	echo.
	echo.
	echo Copy the link to the Youtube video and
	pause
	for /f "tokens=*" %%a in ('cmd /c "%TP%\Youtube\scripts\paste.exe" clip') do set video=%%a
	echo %TP%\Youtube\livestreamer\livestramer.exe %video% best -p %TP%\Youtube\VLCPortable\app\vlc\VLC.exe -l none>>%playlist%
set /a start=%start%+1 
rem next line to adjust the loop speed 
ping localhost -n 1 >nul 
cls 
goto loop
:stop
echo cls>>%playlist%
echo echo Playlist finished.>>%playlist%
echo pause>>%playlist%
echo Finished making playlist!
pause
%TP%\Youtube\youtube.bat