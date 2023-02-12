# Origianlly create to confirm that image syncing
# to external hard drive where success.
#
# This scripts Iterate over each folders in specified
# folders and check if there any difference.
#
#   $ bash sync_image_checker.sh
#
# Advanced (using logfile):
#
#   $ logf=$(mktemp) && echo $logf && bash sync_image_checker.sh | tee $logf

LOCAL_PATH=/home/thorgeir/media/photos/2021
EXTERNAL_PATH=/mnt/icybox/media/photos/2021

FILE_EXLUDE=.xmp

#logfilepath=$(mktemp)
#echo "Log filepath: ${logfilepath}"
dir_file_count () {
    ls ${1} | grep -v ${FILE_EXLUDE} | wc -l | xargs -I {} echo "[{}] files in ${1}"
}

dir_diff () {
    dir1=${1}; shift
    dir2=${1}

    #diff <(find ${dir1}/ -type f -exec md5sum {} + | sort -k 2) <(find ${dir2}/ -type f -exec md5sum {} + | sort -k 2)
    diff --brief --recursive ${dir1} ${dir2} --exclude "*${FILE_EXLUDE}"
}

for local_dir in ${LOCAL_PATH}/*; do
    dir_name=$(basename $local_dir)

    external_dir=${EXTERNAL_PATH}/${dir_name}
    echo "Checking ..."
    #echo $local_dir
    #echo $external_dir

    du -hs $local_dir
    du -hs $external_dir

    dir_file_count $local_dir
    dir_file_count $external_dir

    dir_diff $local_dir $external_dir
done
