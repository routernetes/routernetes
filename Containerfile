FROM quay.io/centos/centos:stream9

RUN dnf -y update && dnf -y install firewalld tuned dnsmasq NetworkManager && dnf -y clean all
