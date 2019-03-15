#!/usr/bin/env bash
cfdisk
# gpt
# sda1 20GB extp
# sda2 2GB swap
mkdir /mnt/lfs
mount -v -t ext4 /dev/sda1 /mnt/lfs
/sbin/swapon -v /dev/sda2
