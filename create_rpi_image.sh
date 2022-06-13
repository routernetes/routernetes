#!/bin/bash
set -e

RELEASE=$(curl -sL https://builds.coreos.fedoraproject.org/streams/stable.json | jq -r '.architectures.aarch64.artifacts.metal.release'| cut -d. -f1)
butane --pretty --strict -o config.ign butane.yaml
mkdir -p /tmp/RPi4boot/boot/efi/
sudo dnf install -y --downloadonly --release=$RELEASE --forcearch=aarch64 --destdir=/tmp/RPi4boot/  uboot-images-armv8 bcm283x-firmware bcm283x-overlays

for rpm in /tmp/RPi4boot/*rpm; do rpm2cpio $rpm | sudo cpio -idv -D /tmp/RPi4boot/; done
sudo mv /tmp/RPi4boot/usr/share/uboot/rpi_4/u-boot.bin /tmp/RPi4boot/boot/efi/rpi4-u-boot.bin

# FCOSDISK=/dev/sdX
# sudo coreos-installer install --architecture=aarch64 -i config.ign $FCOSDISK
#
# FCOSEFIPARTITION=$(lsblk $FCOSDISK -J -oLABEL,PATH  | jq -r '.blockdevices[] | select(.label == "EFI-SYSTEM")'.path)
# mkdir /tmp/FCOSEFIpart
# sudo mount $FCOSEFIPARTITION /tmp/FCOSEFIpart
# sudo rsync -avh --ignore-existing /tmp/RPi4boot/boot/efi/ /tmp/FCOSEFIpart/
# sudo umount $FCOSEFIPARTITION
# rm -rf /tmp/FCOSEFIpart

rm -rf /tmp/RPi4boot
rm -f config.ign
