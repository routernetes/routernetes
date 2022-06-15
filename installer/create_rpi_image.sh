#!/bin/bash
set -e

RELEASE=$(curl -sL https://builds.coreos.fedoraproject.org/streams/stable.json | jq -r '.architectures.aarch64.artifacts.metal.release'| cut -d. -f1)
butane --pretty --strict -o /tmp/config.ign butane.yaml
mkdir -p /tmp/RPi4boot/boot/efi/
dnf install -y --downloadonly --release=$RELEASE --forcearch=aarch64 --destdir=/tmp/RPi4boot/ uboot-images-armv8 bcm283x-firmware bcm283x-overlays

for rpm in /tmp/RPi4boot/*rpm; do rpm2cpio $rpm | cpio -idv -D /tmp/RPi4boot/; done
mv /tmp/RPi4boot/usr/share/uboot/rpi_4/u-boot.bin /tmp/RPi4boot/boot/efi/rpi4-u-boot.bin

rm -f routernetes.img
fallocate -l 3G routernetes.img
losetup -P -f routernetes.img
FCOSDISK=$(losetup -l -J | jq -r '.loopdevices[] | select(."back-file" | endswith("routernetes.img")) | .name')
coreos-installer install --architecture=aarch64 -i /tmp/config.ign $FCOSDISK

sleep 10

FCOSEFIPARTITION=$(lsblk $FCOSDISK -J -oLABEL,PATH | jq -r '.blockdevices[] | select(.label == "EFI-SYSTEM")'.path)
mkdir /tmp/FCOSEFIpart
mount $FCOSEFIPARTITION /tmp/FCOSEFIpart
rsync -avh --ignore-existing /tmp/RPi4boot/boot/efi/ /tmp/FCOSEFIpart/
umount $FCOSEFIPARTITION
losetup -d $FCOSDISK
