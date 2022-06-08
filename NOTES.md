External: eno1
Internal: enp0s20u1

coreos-installer download -f iso
butane --pretty --strict -o install.ign butane.yaml 
butane --files-dir . --pretty --strict -o boot.ign installer.yaml
coreos-installer iso ignition embed -i boot.ign -o boot.iso fedora-coreos-36.20220522.3.0-live.x86_64.iso
rm install.ign boot.ign
