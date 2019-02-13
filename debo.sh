#!/usr/bin/env bash
# Infomasi Distro
server=http://kartolo.sby.datautama.net.id/parrot
arch=amd64
local=/home/afrizal/project/root/
variant=minbase
code_name=stable
keyring=ED05F7B2EC3C9224

# Memasang Key dan Memulai Debootstrap
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED05F7B2EC3C9224
sudo debootstrap --arch=amd64 --variant=minbase stable /home/afrizal/project/root/ http://kartolo.sby.datautama.net.id/parrot
