Install https://github.com/k3s-io/k3s-selinux/releases for k3s

curl -sfL https://get.k3s.io | sh -s - --disable=traefik --disable=servicelb --flannel-backend=host-gw --flannel-iface=enp0s20u1

External: eno1
Internal: enp0s20u1
