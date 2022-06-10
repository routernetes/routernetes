FROM registry.fedoraproject.org/fedora-minimal:36

RUN microdnf -y update && microdnf -y install firewalld tuned dnsmasq NetworkManager && microdnf -y clean all
