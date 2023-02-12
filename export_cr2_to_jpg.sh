#!/bin/bash
#
# bash export_cr2_to_jpg.sh <image>.CR2 <image>.jpg <jpg quality 0-100>
#
# Example: bash export_cr2_to_jpg.sh 5V9A4891.CR2 test.jpg 75
# Exports test.jpg with jpg quality 75 and maximum widht and hight 2048 px (MAX_WITH_HEIGHT).
#
# Created: 2022-12-25T16:45+0000
# Author: Thorgeir Eyfjrod Sigurdsson

MAX_WITH_HEIGHT=2048

image_raw=${1}; shift
image_jpg=${1}; shift
image_quality=${1:-75}; shift

darktable-cli $image_raw --output $image_jpg \
    --width $MAX_WITH_HEIGHT --height $MAX_WITH_HEIGHT \
    --core --configdir ~/.config/darktable \
    --conf plugins/imageio/format/jpeg/quality=${image_quality}
