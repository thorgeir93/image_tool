#!/bin/bash
# $ bash % IMG_8304.jpg IMG_8304_date.jpg
#
source ../env.sh

IMG_IN=${1}; shift
IMG_OUT=${1}; shift

IMG_DATE="01 MAÍ 2021"

#IMG=$(basename -- "${IMG}")
#extension="${filename##*.}"
#filename="${filename%.*}"
while read font; do
    convert "${IMG_IN}" -gravity NorthWest -font ${font} -pointsize 80 -fill ${FONTCOLOR} -annotate 90x90+200+300 "${IMG_DATE}" ${IMG_OUT};
    echo "Applied ${font}, result: ${IMG_OUT}, [ENTER] to continue"
    # read -s < /dev/tty
done <fonts.txt
