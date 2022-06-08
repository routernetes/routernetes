External: eno1
Internal: enp0s20u1

butane --pretty --strict -o install.ign butane.yaml 
butane --files-dir . --pretty --strict -o boot.ign installer.yaml
