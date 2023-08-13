#!/bin/bash
#
# Author: Þorgeir Eyfjörð Sigurðsson
# Date..: 2023-07-23T20:07
# Usage.: $ bash import_from_usb.sh <usb-uuid> <path to mount>
#
#  <usb-uuid> - Find the usb uuid with blkid
# 

mkdir -p /mnt/drone
bash import_from_usb.sh "9C33-6BBD" "/mnt/drone"
