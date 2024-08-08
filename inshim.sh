#!/bin/bash
mount /dev/sda1 /mnt/stateful_partition
if [ "$(id -u)" -ne 0 ]
then
    echo "Run this as root"
fi
cp /usr/share/packeddata/. /mnt/stateful_partition/unencrypted -rvf