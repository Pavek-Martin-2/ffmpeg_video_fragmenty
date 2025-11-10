@echo off
play_all.exe
REM ^ aktualizuje sam sebe pred spustenim aktualniho obsahu adresare,tento soubor do adresare Windows
set /a p=1
echo video %p%/2
mpv -fs "input_1.mp4"
set /a p=p+1
echo video %p%/2
mpv -fs "input_2.avi"
set /a p=p+1
echo video %p%/2
@echo on
