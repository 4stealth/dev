#!/usr/bin/env bash
cfdisk
# gpt
# sda1 20GB extp
# sda2 2GB swap
mkdir /mnt/lfs
mount -v -t ext4 /dev/sda1 /mnt/lfs
/sbin/swapon -v /dev/sda2
mkdir -v /mnt/lfs/sources
chmod -v a+wt /mnt/lfs/sources
cd /mnt/lfs/sources
wget https://repo.blackhat.web.id/base/wget-list.txt
wget --input-file=wget-list.txt --continue --directory-prefix=/mnt/lfs/sources
mkdir -v /mnt/lfs/tools
ln -sv /mnt/lfs/tools /
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs
chown -v lfs /mnt/lfs/tools
chown -v lfs /mnt/lfs/sources
su - lfs
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash 
EOF
cat > ~/.bashrc << "EOF"
set +humask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF
source ~/.bash_profile
mkdir -v build
