#!/bin/bash
set -e

DEST_DEVICE=${DEST_DEVICE:-/dev/sda}

rm -f routernetes.iso
coreos-installer download -f iso -C /tmp
butane --pretty --strict -o /tmp/config.ign /etc/butane.yaml
coreos-installer iso customize \
    --dest-device "${DEST_DEVICE}" \
    --dest-ignition /tmp/config.ign \
    -o routernetes.iso /tmp/fedora-coreos-*-live.x86_64.iso
