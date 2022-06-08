Install https://github.com/k3s-io/k3s-selinux/releases for k3s

Configure inside interface as static 10.0.0.1/24

curl -sfL https://get.k3s.io | sh -s - --disable=traefik --disable=servicelb --flannel-backend=host-gw --flannel-iface=???? -i 10.0.0.1
