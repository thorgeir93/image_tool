#!/bin/bash
#
# bash export_images_for_cloud.sh <folder containing CR2 files>
#
# Example: bash export_images_for_cloud.sh /home/thorgeir/media/photos/2022 /home/thorgeir/media/cloud
#
#
# Exports all CR2 (raw images) found in the first given folder to the latter given folder.

#
# Created: 2022-12-25T16:45+0000
# Author: Thorgeir Eyfjrod Sigurdsson
#

set -o xtrace

folder_raw=${1}; shift
folder_cloud=${1}; shift

#pushd $folder_raw

for img in $(find $folder_raw -type f -name "*.CR2"); do
    img_name=$(basename $img)
    img_name=${img_name%.*}

    bash export_cr2_to_jpg.sh $img $folder_cloud/${img_name}.jpg 

done

#popd
