#!/usr/bin/bash

# pro prehravac mpv

# vsechny videa v adresari da do pole
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

#du=3600000 # bude zobrazovat stale ( maximalni hodnota )
du="4000"
# --osd-duration=$du

barva=("#00A2E8" "#22B14C" "#22B14C" "#FF7F27")
ba=${barva[3]}
# barva textu OSD

for (( index = 0; index < $d_pole; index++ )); do
video=${pole[$index]}
echo $video

# velikost fontu
str="height"
video_height=$(ffprobe -v error -show_entries stream=$str $video | grep $str | awk -F'=' '{print $2}')
#video_height=$(mediainfo $video | grep "Height" | awk -F' ' '{print $3}')
echo "vyska videa : "$video_height
font=$(( $video_height / 20 ))
echo "velikost fontu OSD : "$font
sleep 2

# zobrazuje nazev videa a kolikate hraje video z celkoveho poctu v OSD
text_osd=$(($index + 1))
text_osd+="/"
text_osd+=$d_pole
echo $text_osd
sleep 2
mpv -fs --osd-level=3 --osd-font-size=$font --osd-playing-msg=$text_osd --osd-duration=$du --osd-color=$ba $video
done

echo "vse prehrano"
