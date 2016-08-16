@echo off
title GMA builder...
:options
set outputfilename=dropit.gma
:build
echo Building... Output file name: %outputfilename%
"%GMOD_HOME%\gmad.exe" create -folder "%cd%\src" -out "%cd%\%outputfilename%"
echo.
echo Process returned %ERRORLEVEL%.
pause
:stop