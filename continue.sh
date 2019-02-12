#!/usr/bin/env bash
sudo cp /etc/resolv.conf root/etc/
sudo mount --bind /dev/ root/dev
sudo chroot root
mount -t proc none /proc && mount -t sysfs none /sys && mount -t devpts none /dev/pts
export HOME=/root && export LC_ALL=C
