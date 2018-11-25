echo off
set /p directory="Enter directory path with pictures you want to compress: "
echo Compressing pictures in directory %directory%...
magick mogrify -resize 2000x -quality 85 "%directory%\*.jpg"
echo Done.
timeout 2 >NUL
exit
