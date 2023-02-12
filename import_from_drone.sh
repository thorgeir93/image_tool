#!/bin/bash
#
# Author: Þorgeir Eyfjörð Sigurðsson
# Date..: 2022-09-10T22:07
# Usage.: $ bash import_from_drone.sh
#
# 1) Import photos from connected USB stick (UUID is specified in this script).
# 2) Then date classify all the image and movies from the current location to defined image folder.
# For example image a.jpg from the current location was modified 2019-10-23
# it will be moved into directory 2019/2019_10_23 into the defined image folder.

set -o errexit
set -o xtrace

# Find a new UUID of a for your device if you want
# to use this method for your USB's.
USB_UUID="9C33-6BBD"
DEVICE_PATH=$(lsblk -pfr -o NAME,UUID | grep "$USB_UUID" | cut -d' ' -f1)

function mount_usb () {
    # TODO verify device path.
    sudo mount $DEVICE_PATH /mnt/drone
}

function import_photos () {
    # See list of open ports
    gphoto2 --list-ports

    gphoto2 --auto-detect

    mkdir -p ./tmp
    pushd ./tmp
    gphoto2 --get-all-files
    popd

    bash move_photos_from.sh $(pwd)/tmp/

}

function import_from_drone () {
    echo "This method assumes that the drone's disk card "
    echo "is inserted into the computer using USB adapter."

    mount_usb
    import_photos
 
    echo "Please unmount the device $DEVICE_PATH ($UUID) after with this command:"
    echo "$ sudo umount $DEVICE_PATH"
}


import_from_drone
