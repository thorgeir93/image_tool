#!/bin/bash
# vim: set foldmethod=manual:
# View photos in a given directory.
#
#
# KEYS:
#
#   1 - Moves the focus photo to "use01" directory. Both JPG and CR2.
#   2 - Moves the focus photo to "use02" directory. Both JPG and CR2.
#   6 - Removes the focus photo. Only the focused image.
#   7 - Removes the focus photo. Both JPG and CR2.
#
# Usage: bash view_image.sh <DIRECTORY>
#
# Interesting configs and scripts around feh.
# -> https://forums.bunsenlabs.org/viewtopic.php?id=704
#
DIRECTORY=${1}

if [ ! -d "${DIRECTORY}" ]; then
    echo "${DIRECTORY} is not a directory!" && exit 11
fi

pushd ${DIRECTORY}

tool_dir=~/github/thorgeir/image_tool
mv_img=${tool_dir}/mv_image.sh 
cp_img=${tool_dir}/cp_image.sh 


# CR2 only supported for now.
#feh -F *.CR2 \
#feh --scale-down --auto-zoom *.CR2 \
#feh -F --no-menus *.CR2 \
feh -F -d -S filename *.CR2 \
    --no-recursive \
    --action1 "${mv_img} $(pwd)/%f $(pwd)/use01" \
    --action2 "${mv_img} $(pwd)/%f $(pwd)/use02" \
    --action4 "${cp_img} $(pwd)/%f $(pwd)/use01" \
    --action7 "${tool_dir}/rm_image.sh $(pwd)/%N"
    #--preload \

popd
