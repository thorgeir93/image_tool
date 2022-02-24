#!/bin/bash
# $ bash % IMG_8304.jpg IMG_8304_date.jpg
#
source ./env.sh

IMG_IN=${1}; shift
IMG_OUT=${1}; shift

IMG_DATE=$(bash get_date_from_image.sh "${IMG_IN}")

convert "${IMG_IN}" -gravity South -font ${FONT} -pointsize ${FONTSIZE} -fill ${FONTCOLOR} -annotate ${ANNOTATE}  "${IMG_DATE}" ${IMG_OUT};
