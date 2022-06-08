FROM quay.io/centos/centos:stream9

RUN dnf -y update && dnf -y install firewalld dnsmasq && dnf -y clean all
