
REM ----- right ------
ffmpeg -i input.mp4 -vf "crop=iw*2/3:ih:iw/3:0" output_right_2-3-a.mp4 -y
REM 3 = 480x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.1:ih:iw/3:0" output_right_2-3-b.mp4 -y
REM 2.1 = 686x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.2:ih:iw/3:0" output_right_2-3-c.mp4 -y
REM 2.2 = 654x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.3:ih:iw/3:0" output_right_2-3-d.mp4 -y
REM 2.3 = 626x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.4:ih:iw/3:0" output_right_2-3-e.mp4 -y
REM 2.4 = 600x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.5:ih:iw/3:0" output_right_2-3-f.mp4 -y
REM 2.5 = 576x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.6:ih:iw/3:0" output_right_2-3-g.mp4 -y
REM 2.6 = 554x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.7:ih:iw/3:0" output_right_2-3-h.mp4 -y
REM 2.7 = 532x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.8:ih:iw/3:0" output_right_2-3-i.mp4 -y
REM 2.8 = 514x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.9:ih:iw/3:0" output_right_2-3-j.mp4 -y
REM 2.9 = 496x1280
REM  ( cim vic se desetiny blizi ke "3" tak je sirka videa mensi )

goto exit

REM ----- left ------ tady je to stejny akorat ze vlevo
ffmpeg -i input.mp4 -vf "crop=iw*2/3:ih:0:0" output_left_2-3.mp4 -y
REM 3 = 480x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.5:ih:0:0" output_left_2-3-b.mp4 -y
REM 2.5 = 576x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.6:ih:0:0" output_left_2-3-c.mp4 -y
REM 2.6 = 554x1280

ffmpeg -i input.mp4 -vf "crop=iw*2/2.7:ih:0:0" output_left_2-3-d.mp4 -y
REM 2.7 = 532x1280

:exit

pause
