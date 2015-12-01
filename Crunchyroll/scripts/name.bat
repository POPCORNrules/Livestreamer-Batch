@echo off
color 0a
title Name the Series/Episode.
set /p "Series=What is the name of the series you are recording?: "
set /p "episode=What is the name of the episode you want to record?: "
%TP%\Crunchyroll\scripts\record.bat
