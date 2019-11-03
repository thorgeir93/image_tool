#!/bin/bash
# Move all image from IMG_SOURCE_DIR to IMG_DEST_DIR.
# All images are classify into date folders, for example
# image a.jpg from the IMG_SOURCE_DIR is modified 2019-10-23
# it will be moved into directory 2019_10 into IMG_DEST_DIR.

set -o errexit

IMG_DEST_DIR=/home/thorgeir/Pictures/from_camera
IMG_SOURCE_DIR=/home/thorgeir

# IMPORT PHOTOS, Navigate to directory where you want to downloaded to.
# and run the fowllowing commands.
#gphoto2 --auto-detect
#gphoto2 --get-all-files

#for img in $(find ${IMG_SOURCE_DIR} -maxdepth 1 -type f -name "IMG_*"); do
for img in ${IMG_SOURCE_DIR}/{IMG_,MVI_}*; do
    img_modified_date=$(stat -c %y $img | sed 's/-/_/g' | cut -d' ' -f1)
    img_modified_year=$(echo ${img_modified_date} | cut -d'_' -f1)

    img_dest_folder=${IMG_DEST_DIR}/${img_modified_year}/${img_modified_date}
    mkdir -p ${img_dest_folder}

    img_dest_endpoint=${img_dest_folder}/$(basename ${img})

    (set -x; mv ${img} ${img_dest_endpoint})
done
