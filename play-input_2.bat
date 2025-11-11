@echo off
verify on
title tisiciny vteriny v OSD

REM parametr "--osd-fractions" dela tisiciny vteriny
type %appdata%\mpv\mpv.conf
REM lze vystvorit take soubor mpv.conf a naplnit ho parametrama
REM mpv.exe se pak pri spusteni podiva jestli tento soubor existuje a paklize ano
REM tak ho pouzije

set cerna="#000000"
set bila="#FFFFFF"
set opakuj="1"
set tisiciny="yes"
set bez_tisicin="no"
set font="40"
set rychlost="0.25"
set file="input_2.avi

mpv --quiet=yes --loop=%opakuj% -mute -speed=%rychlost% --osd-fractions=%tisiciny% --osd-level=3 --osd-font-size=%font% --osd-color=%cerna% --osd-border-color=%bila% --osd-back-color=%bila% --window-scale=2 %file%

REM pause

REM PRO LINUX "mpv --quiet --loop -mute --osd-fractions --osd-level=3 --osd-font-size=40 --osd-color=#000000 --osd-border-color=#FFFFFF --osd-back-color=#FFFFFF $1"


