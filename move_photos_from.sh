#!/bin/bash
# Move or Copy all media from given path to the right place on the disk.
#
# All images are classify into date folders, for example
# image a.jpg from the given path is modified 2019-10-23
# it will be moved into directory 2019/2019_10_23 in the
# Photo folder.
#
# Author: Thorgeir Sigurdsson
# Date: Sun Nov  3 18:05:26 UTC 2019
#
# Example Usage: bash move_photos_from.sh /home/thorgeir
#   This command will move
#   move /home/thorgeir/*.JPG and other extension files
#   to ~/Pictures/from_camera/<year>/<year_month_day>

set -o errexit

IMG_SOURCE_DIR=${1}; shift

IMG_DEST_DIR=~/Pictures/from_camera

# "allows filename patterns which match no files to
#   expand to a null string, rather than themselves"
shopt -s nullglob

for img in ${IMG_SOURCE_DIR}/*.{MP4,THM,JPG,CR2,MOV}; do

    img_modified_date=$(stat -c %y $img | sed 's/-/_/g' | cut -d' ' -f1)
    img_modified_year=$(echo ${img_modified_date} | cut -d'_' -f1)

    img_dest_folder=${IMG_DEST_DIR}/${img_modified_year}/${img_modified_date}
    mkdir -p ${img_dest_folder}

    img_dest_endpoint=${img_dest_folder}/$(basename ${img})

    (set -x; mv ${img} ${img_dest_endpoint})
done
