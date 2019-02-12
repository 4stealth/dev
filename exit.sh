#!/usr/bin/env bash
apt-get clean && apt-get autoremove && rm -rf /tmp/* ~/.bash_history
umount /proc && umount /sys && umount /dev/pts
exit
sudo umount root/dev
