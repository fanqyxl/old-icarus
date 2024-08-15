#!/bin/bash
mount /dev/sda1 /mnt/stateful_partition/
mkfs.ext4 -F /dev/mmcblk0p1 # This only wipes the stateful partition
mount /dev/mmcblk0p1 /tmp
if [ "$(id -u)" -ne 0 ]
then
    echo "Run this as root"
fi
cp /mnt/stateful_partition/usr/share/packeddata/. /tmp/unencrypted/ -rvf
umount /tmp
chown -R 1000 /mnt/stateful_partition/unencrypted
crossystem disable_dev_request=1
reboot