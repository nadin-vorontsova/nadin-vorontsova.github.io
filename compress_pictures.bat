echo off
set /p directory="Enter directory path with pictures you want to compress: "
echo Compressing pictures in directory %directory%...
magick mogrify -strip -interlace Plane -gaussian-blur 0.05 -quality 85  "%directory%\*.*"
echo Done.
timeout 2 >NUL
exit
