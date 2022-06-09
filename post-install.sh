#!/bin/bash

curl -sfL https://get.k3s.io | sh -s - --disable=traefik --disable=servicelb --flannel-backend=host-gw -i 127.0.0.1
