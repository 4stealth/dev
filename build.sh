#!/usr/bin/env bash
apt-get update
apt-cache search linux-image
apt-get install --no-install-recommends linux-image-amd64 live-boot systemd-sysv
apt-get install --no-install-recommends network-manager net-tools wireless-tools wpagui curl openssh-client blackbox xserver-xorg-core xserver-xorg xinit xterm nano 
