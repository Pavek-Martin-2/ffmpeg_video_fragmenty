@echo off
ffmpeg -y -f concat -i filelist.txt spojene_videa.mp4
%mpvs% spojene_videa.mp4
pause
