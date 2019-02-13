#!/usr/bin/env bash
# Baris Perintah di dalam chroot
apt-get clean && apt-get autoremove && rm -rf /tmp/* ~/.bash_history
umount /proc && umount /sys && umount /dev/pts
exit
# Baris Perintah setelah keluar chroot
sudo umount root/dev
