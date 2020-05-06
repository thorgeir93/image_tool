#!/bin/bash
# Author: Thorgeir Sigurdsson
#
# $ bash % /home/thorgeir/Pictures/from_camera/2020/2020_04_08/test.CR2
#  Will execute:
#   --> rm /home/thorgeir/Pictures/from_camera/2020/2020_04_08/test.CR2
#   --> rm /home/thorgeir/Pictures/from_camera/2020/2020_04_08/test.JPG

set -o xtrace

filepath=${1}; shift

folderpath=$(dirname $filepath)
filename=$(basename $filepath)

# asdf.txt -> asdf
filename=${filename%%.*}

rm $filepath
rm ${folderpath}/${filename}.JPG
