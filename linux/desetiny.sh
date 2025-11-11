#!/usr/bin/bash
clear

input="input.mp4"

prefix=${input:0:${#input}-4}
prefix+="_"
#echo  $prefix

for i in {0..9}; do
# ffmpeg -i input.mp4 -filter:v "crop=iw*2/2.4:ih:iw/3:0" dve_tretiny_vpravo-B.mp4 -y

str="ffmpeg -y -i "
str+=$input

str+=' -vol 0 -filter:v "crop=iw*2/2.'
str+=$i
str+=':ih:iw/3:0"'

str2=" input_2."
str2+=$i
str2+=".mp4"

str3=$str$str2
echo $str3

#eval $str3
done

# vysledky
for x in input_2*; do
echo $x
mediainfo $x | grep "Width"
done

