#!/bin/bash
# Author: Thorgeir Sigurdsson
#
# $ bash % /home/thorgeir/Pictures/from_camera/2020/2020_04_08/test.CR2 \
#           /home/thorgeir/Pictures/from_camera/2020/2020_04_08/use01
#  Will execute:
#   --> mv /home/thorgeir/Pictures/from_camera/2020/2020_04_08/test.* \
#               /home/thorgeir/Pictures/from_camera/2020/2020_04_08/use01/
set -o xtrace

filepath=${1}; shift
filepath=${filepath%%.*}

mkdir -p ${1}

mv ${filepath}.* ${1}/
