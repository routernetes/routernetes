#!/bin/bash
coreos-installer download -f iso
butane --pretty --strict -o config.ign butane.yaml
coreos-installer iso customize \
    --dest-device /dev/sda \
    --dest-ignition config.ign \
    -o routernetes.iso fedora-coreos-*-live.x86_64.iso
rm -f config.ign
rm -f fedora-coreos-*-live.x86_64.iso*
