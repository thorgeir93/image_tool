# Sync image to external hard disk

Run this command on different terminal to watch 
what happen for external hard drives.

  $ udisksctl monitor


Mount my icybox external hard drive to my local directory.
First you can choose partition using this command:

  $ disk_path=$(lsblk -pJO | jq '.blockdevices | .[] | select(.size == "3.7T" and .serial == "152D00539000") | .children | .[] | select(.size == "1T" and .label == "Linux1T") | .name'\)
  $ mkdir -p /mnt/icybox
  $ sudo mount ${disk_path} /mnt/icybox
  $ cd ~/media/photos


Notice the end-backslash on the first '2020'.
Remove -n flag if you want to run this command.
-n is just dry run and shows what will happen.

  $ rsync -anv 2020/ /mnt/icybox/media/photos/2020


Count number files in directories under current path.

  $ for dir in $(ls); do echo -n "$dir: "; ls $dir | wc -l; done

Confirm no difference between image folders:

    $ bash sync_image_checker.sh

Edit the variables in the above script to point to the right directories.

Another aproach to check.
Credit: https://askubuntu.com/questions/421712/comparing-the-contents-of-two-directories

  $ diff <(find videos/ -type f -exec md5sum {} + | sort -k 2) <(find /run/media/thorgeir/Linux1T/media/videos/ -type f -exec md5sum {} + | sort -k 2)

