@echo off
setlocal enabledelayedexpansion
set "IN=%~1"
if exist "!IN!" (

REM jestlize neni parametr %~1 a nebo je prazdny "" tak skoc na navesti :help
REM vypis usage a skonci
REM v opacnem pripade proved prikaz %mpvs% z paramerem 1 nazev videa
REM a pak skoc rovnou na label :konec ( tzn. preskoc :help )

REM echo existuje "!IN!"
%mpvs% "!IN!"
REM nechat "!IN!" funguje pro nazvy z mezerama a specialnima znakama !
goto konec
)
endlocal

:help
echo mpvs "nejake video (1).mp4"
REM soubor mpvs.bat presunout do adresare Windows ( a nebo nekam jinam v ceste %PATH% )
REM predpoklada se ze uz je nadefinovana systemova promenna %mpvs% ( viz. screenshoty jinde ) 
REM v konzoli zadat prikaz echo %PATH%

:konec
REM pause


