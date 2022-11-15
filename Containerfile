FROM registry.fedoraproject.org/fedora-minimal:37

RUN microdnf -y update && microdnf -y install firewalld tuned dnsmasq NetworkManager && microdnf -y clean all
