#!/usr/bin/bash

if [ -z "$1" ]; then
help=${0##*/}
echo $help' "nazev videa.mp4"'
exit 1
fi

video=$1

# velikost fontu
str="height"
video_height=$(ffprobe -v error -show_entries stream=$str $video | grep $str | awk -F'=' '{print $2}')
echo "vyska videa : "$video_height
font=$(( $video_height / 20 ))
echo "velikost fontu OSD : "$font
sleep 2

ffplay -fs -autoexit -noborder -loglevel error -vf "drawtext=text='%{pts\:hms}':fontsize=$font:box=1:x=(w-tw)/2:y=h-(2*lh)" $video

