@echo off
if "%1" == "" goto help
if not exist %1 goto help
REM jestlize neni parametr %1 ($1) a nebo je prazdny tak skoc na jdi navesti :help
REM vypis usage a skonci
REM v opacnem pripade proved prikaz %mpvs% z paramerem %1% nazev videa
REm a skoc na label konec ( tzn. preskoc :help )

%mpvs% %1%
goto konec

:help
usage:
echo mpvs video.mp4
REM soubor mpvs.bat presunout do adresare Windows ( a nebo nekam jinam v cete %PATH% )
REM predpoklada se ze uz je nadefinovana systemova promenna %mpvs% ( viz. screenshoty jinde ) 
REM v konzoli zadat prikaz echo %PATH%

:konec
REM pause


