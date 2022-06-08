FROM quay.io/centos/centos:stream9

RUN dnf -y update && dnf -y install firewalld dnsmasq python3-pip && dnf -y clean all && pip3 install ansible-core
