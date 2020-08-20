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
DIRECTORY=${1}

if [ ! -d "${DIRECTORY}" ]; then
    echo "${DIRECTORY} is not a directory!" && exit 11
fi

pushd ${DIRECTORY}

mkdir -p $(pwd)/use01
mkdir -p $(pwd)/use02

tool_dir=~/github/thorgeir/image_tool
mv_img=${tool_dir}/mv_image.sh 


# CR2 only supported for now.
feh -F *.CR2 \
    --action1 "${mv_img} $(pwd)/%f $(pwd)/use01" \
    --action2 "${mv_img} $(pwd)/%f $(pwd)/use02" \
    --action7 "${tool_dir}/rm_image.sh $(pwd)/%N"

popd
