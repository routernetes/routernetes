## Create an ISO
```
podman run --pull=always --rm -v .:/data:Z -w /data quay.io/routernetes/create-iso:latest
```
