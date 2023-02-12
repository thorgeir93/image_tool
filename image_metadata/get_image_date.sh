#!/bin/bash
#
# Get date from a given image and display to stdout
# the date in icelandic format.
#
# Example Usage:
#  $ bash get_image_date.sh /home/thorgeir/media/photos/export/myndabok2022/print/IMG_2027.jpg
#> 1. Júlí 2021
# 
# Originally create to get icelandic dates from
# images used in the photobook 2022 to make sure
# date is correct.

image=${1}; shift

year=$(exiftool -d "%Y" -DateTimeOriginal -S -s $image)
month=$(exiftool -d "%m" -DateTimeOriginal -S -s $image)
day=$(exiftool -d "%e" -DateTimeOriginal -S -s $image)

case $month in

  01)
    month="janúar"
    ;;
  02)
    month="febrúar"
    ;;
  03)
    month="mars"
    ;;
  04)
    month="apríl"
    ;;
  05)
    month="maí"
    ;;
  06)
    month="júní"
    ;;
  07)
    month="júlí"
    ;;
  08)
    month="ágúst"
    ;;
  09)
    month="september"
    ;;
  10)
    month="október"
    ;;
  11)
    month="nóvember"
    ;;
  12)
    month="desember"
    ;;
  *)
    month=unknown
    ;;
esac

echo ${day}. ${month} ${year}
