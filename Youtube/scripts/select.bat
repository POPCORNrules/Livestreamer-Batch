
color 0a
cd %TP%\Youtube\playlists
echo Saved playlists:
echo.
    for /R %%f in (*.bat) do (
    echo %%~nf
)
echo.
echo.
set /p "select=Which playlist do you want to watch? (e.g. funny videos): "
cls
%select%.bat
pause
%TP%\Youtube\youtube.bat