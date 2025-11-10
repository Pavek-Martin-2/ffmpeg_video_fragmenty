@echo off
title ffmpeg_video_fragmenty.ps1

set /p "in=zadej nazev vstupniho videa : "
REM echo %in%

REM powershell -noexit -file ffmpeg_video_fragmenty.ps1 %in%
REM powershell -file ffmpeg_video_fragmenty.ps1 %in%
ffmpeg_video_fragmenty.exe %in%
