#!/usr/bin/bash

pole=(*.mp4)
declare -p pole

d_pole=${#pole[@]}
#echo $d_pole

# paklize nejni v adresari zadne video, bude hodnota pole[0] = "*.mp4"
# paklize je jedno video bude hodnota pole[0] = "nejaky_nazev_videa.mp4"
test=${pole[0]}
#echo $test

if [[ "$test" == "*.mp4" ]]; then
echo "adresar neobsahuje zadna videa"
echo "konec"
exit
fi


stop=$((d_pole - (2 * d_pole)))
#echo $stop

poc=$d_pole


# bude prehravat pozpatku, od posledniho videa v $pole do prvniho
for (( reverse_index = -1; reverse_index >= $stop; reverse_index--)); do
#echo $reverse_index
video=${pole[$reverse_index]}
#echo $video

# zobrazuje nazev videa a kolikate hraje video z celkoveho poctu
info=$video
info+=" - "
info+=$poc
((poc--))
info+="/"
info+=$d_pole
echo $info

# velikost fontu - ffprobe version 4.2.7
str="height"
video_height=$(ffprobe -v error -show_entries stream=$str $video | grep $str | awk -F'=' '{print $2}')
echo "vyska videa : "$video_height
font=$(( $video_height / 20 ))
echo "velikost fontu OSD : "$font
sleep 2
ffplay -fs -autoexit -loglevel error -vf "drawtext=text='%{pts\:hms}':fontsize=$font:box=1:x=(w-tw)/2:y=h-(2*lh)" $video
done

echo "vse prehrano"

