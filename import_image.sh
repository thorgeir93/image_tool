#!/bin/bash
# Import photos from connected camera to the current locatoin on disk.
# Then date classify all the image and movies from the current location to
# pictures folder.
# For example image a.jpg from the current location was modified 2019-10-23
# it will be moved into directory 2019/2019_10_23 into pictures folder.

set -o errexit
set -o xtrace

function import_ricoh () {
    #TODO Use ACTION in gphoto2 app. See gphoto2 manpage.
    mkdir -p ./tmp
    pushd ./tmp
    gphoto2 --get-all-files --filename=%f_%03n.%C
    #gphoto2 --get-all-files
    rm ./*.txt
    popd
    bash move_photos_from.sh $(pwd)/tmp/
}


function import_6d () {
    gphoto2 --get-all-files
    bash move_photos_from.sh $(pwd)
}

# Connect to connected camera
gphoto2 --auto-detect

CAMERA_MODEL=$(gphoto2 --summary 2>/dev/null | grep -i model)

if [[ "$CAMERA_MODEL" == *"RICOH"* ]]; then
    import_ricoh
else
    import_6d
fi
