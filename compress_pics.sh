#!/bin/bash

MAX_WIDTH=800
MAX_HEIGHT=800

for pic in $(find assets/img/seville -type f -iname *.jpg); do
    pic_filename=$(basename $pic)
    # dont touch background picture
    if find . -type f -iname "*.markdown" | xargs cat | grep "img:" | grep -q $pic_filename; then
        echo $pic is skipped
        continue
    fi

    width=$(identify -format "%w\n" $pic)
    height=$(identify -format "%h\n" $pic)
    if [ "$width" > "$MAX_WIDTH" ]; then
        echo Resizing width of $pic...
        convert -resize ${MAX_WIDTH}x $pic $pic
    fi

    if [ "$height" > "$MAX_HEIGHT" ]; then
        echo Resizing height of $pic...
        convert -resize x${MAX_HEIGHT} $pic $pic
    fi

done
