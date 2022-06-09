coreos-installer download -f iso
butane --pretty --strict -o config.ign butane.yaml
coreos-installer iso customize \
    --dest-device /dev/sda \
    --dest-ignition config.ign \
    --post-install post-install.sh \
    -o custom.iso fedora-coreos-36.20220522.3.0-live.x86_64.iso
rm config.ign
