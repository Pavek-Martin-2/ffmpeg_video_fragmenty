#!/usr/bin/bash
# ffmpeg video fragmenty

if [ -z "$1" ]; then
h=${0##*/}
echo $h" input.mp4"
exit 0
fi

input=$1
echo $input

prefix=${input:0:${#input}-4}
poc=1

for aa in 0 1 2; do
  for bb in 0 1 2; do
    ffmpeg -i "$input" -filter:v "crop=iw/3:ih/3:iw/3*${bb}:ih/3*${aa}" $prefix"_"$poc".mp4" -y
    (( poc++ ))
  done
done

# 1/2
ffmpeg -i input.mp4 -filter:v "crop=iw/2:ih:0:0" leva_pulka.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw/2:ih:iw/2:0" prava_pulka.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw:ih/2:0:0" horni_pulka.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw:ih/2:0:ih/2" dolni_pulka.mp4 -y
# 2/3
ffmpeg -i input.mp4 -filter:v "crop=iw:ih*2/3:0:0" dve_tretiny_nahore.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw:ih*2/3:0:ih/3" dve_tretiny_dole.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw*2/3:ih:iw/3:0" dve_tretiny_vpravo.mp4 -y
# ffmpeg -i input.mp4 -filter:v "crop=iw*2/2.4:ih:iw/3:0" dve_tretiny_vpravo-B.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw*2/3:ih:0:0" dve_tretiny_vlevo.mp4 -y
# 1/3
ffmpeg -i input.mp4 -filter:v "crop=iw:ih/3:0:0" horni_horizontalni_tretina.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw:ih/3:0:ih/3" prostredni_horizontalni_ttretina.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw:ih/3:0:2*ih/3" dolni_horizontalni_tretina.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw/3:ih:0:0" leva_vertikalni_tretina.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw/3:ih:iw/3:0" prostredni_vertikalni_tretina.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw/3:ih:2*iw/3:0" prava_vertikalni_tretina.mp4 -y
# 1/4
ffmpeg -i input.mp4 -filter:v "crop=iw/2:ih/2:iw/2:0" prava_horni_ctvrtina.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw/2:ih/2:0:0" leva_horni_ctvrtina.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw/2:ih/2:iw/2:ih/2" prava_dolni_ctvrtina.mp4 -y
ffmpeg -i input.mp4 -filter:v "crop=iw/2:ih/2:0:ih/2" leva_dolni_ctvrtina.mp4 -y

echo "vse hotovo"
sleep 5

