#!/bin/bash
# Import photos from connected camera to the current locatoin on disk.
# Then date classify all the image and movies from the current location to
# pictures folder.
# For example image a.jpg from the current location was modified 2019-10-23
# it will be moved into directory 2019/2019_10_23 into pictures folder.

set -o errexit
set -o xtrace

gphoto2 --auto-detect
gphoto2 --get-all-files

bash move_photos_from.sh $(pwd)
