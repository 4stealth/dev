#!/bin/env bash
version_kernel="4.19.0-parrot1-13t-amd64"
sudo rm -rf dvd/live/initrd.lz
sudo cp root/boot/initrd.img-$version_kernel-generic dvd/live/initrd.lz
sudo rm -rf dvd/live/vmlinuz
sudo cp root/boot/vmlinuz-$version_kernel-generic  dvd/live/vmlinuz
sudo rm ./dvd/live/filesystem.squashfs 
sudo chmod +w ./dvd/live/filesystem.manifest
sudo su
# sudo chroot root dpkg-query -W --showformat='${Package} ${Version}\n' > ./dvd/live/filesystem.manifest
# printf $(sudo du -sx --block-size=1 root | cut -f1) > ./dvd/casper/filesystem.size
# exit
sudo cp  dvd/live/filesystem.manifest  dvd/live/filesystem.manifest-desktop
sudo mksquashfs root dvd/live/filesystem.squashfs -b 1048576 -comp xz -Xdict-size 100%
cd dvd && sudo rm MD5SUMS
find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee MD5SUMS
cd ..
sudo mkisofs -r -V "4stealth-amd64" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ./xentaos-2.0LTS-cinnamon-amd64-dev.iso dvd
sudo chmod 777 4stealth-amd64.iso
