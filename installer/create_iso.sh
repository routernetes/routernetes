#!/bin/bash
set -e

rm -f routernetes.iso
coreos-installer download -f iso -C /tmp
butane --pretty --strict -o /tmp/config.ign butane.yaml
coreos-installer iso customize \
    --dest-device /dev/sda \
    --dest-ignition /tmp/config.ign \
    -o routernetes.iso /tmp/fedora-coreos-*-live.x86_64.iso
