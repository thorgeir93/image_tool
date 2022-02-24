#!/bin/bash
# $ bash % IMG_9037.jpg
#
IMG=${1}; shift

DATE=$(identify -format '%[EXIF:DateTimeOriginal]' ${IMG} | cut -d' ' -f1)

# Convert "2021:05:11" to "Maí 2021"
bash date_simplify.sh ${DATE} ':'
