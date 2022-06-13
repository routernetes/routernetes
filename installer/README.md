## Create an ISO
```
podman run --pull=always --rm -v .:/data:Z -w /data quay.io/routernetes/create-iso:latest
```

A file named ```routernetes.iso``` will be created in your working directory.
