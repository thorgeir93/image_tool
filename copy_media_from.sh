#!/bin/bash
# Copy all media from given path to the right place on the disk.
#
# All images are classify into date folders, for example
# image a.jpg from the given path is modified 2019-10-23
# it will be moved into directory 2019/2019_10_23 in the
# Photo folder.
#
# Author: Thorgeir Sigurdsson
# Date: Sat Mar 11 09:09:41 AM GMT 2023
#
# Usage: bash copy_media_from.sh <source folder> <optional destinition folder>
#
# Example Usage: bash copy_media_from.sh /home/thorgeir
#   This command will move
#   copy /home/thorgeir/*.JPG and other extension files
#   to ~/media/photos/<year>/<year_month_day>
#
# OR
#
# Example Usage: bash copy_media_from.sh /home/thorgeir ~/media/photos/cloud

# TODO fast=1 then use stat to be quick, but works not alwasy, works for new images.

set -o errexit

IMG_SOURCE_DIR=${1}; shift
IMG_DEST_DIR="${1:-$HOME/media/photos}";

# Find the creation date from a image as fast as possible but is not as accurate.
# Works well with new images. Does not work with images that have been modified in some way.
# Set FAST=true to make the script fast.
# Otherwise FAST=false to make sure the dates are correct.
# Default: true
FAST=${FAST:-true}


# "allows filename patterns which match no files to
#   expand to a null string, rather than themselves"
shopt -s nullglob

for img in ${IMG_SOURCE_DIR}/*.{MP4,JPG,jpg,CR2,MOV,DNG,xmp,NEF}; do

    # using identify is too slow!! maybe when import, use stats (not as accuraty)

    if [[ "${FAST}" == "true" ]]; then
        img_modified_date=$(stat -c %y $img | sed 's/-/_/g' | cut -d' ' -f1)
        img_modified_year=$(echo ${img_modified_date} | cut -d'_' -f1)
    else
        img_modified_date=$(exiftool -CreateDate -csv $img | tail -n1 | cut -d, -f2 | cut -d" " -f1 | sed 's/:/_/g')
        img_modified_year=$(identify -verbose $img | grep exif:DateTimeOriginal | cut -d: -f3)
    fi

    img_dest_folder=${IMG_DEST_DIR}/${img_modified_year}/${img_modified_date}
    mkdir -p ${img_dest_folder}

    img_dest_endpoint=${img_dest_folder}/$(basename ${img})

    (set -x; cp ${img} ${img_dest_endpoint})
    #echo mv ${img} ${img_dest_endpoint}
done
