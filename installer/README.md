## Create an ISO
```
podman run --pull=always --rm -v .:/data:Z -w /data quay.io/routernetes/create-iso:latest
```

A file named ```routernetes.iso``` will be created in your working directory.

## Create an RPI image
```
sudo podman run --pull=always --privileged --rm -v /dev:/dev -v /run/udev:/run/udev -v .:/data:Z -w /data quay.io/routernetes/create-rpi-image:latest
```

A file named ```routernetes.img``` will be created in your working directory.
