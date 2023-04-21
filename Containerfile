FROM registry.fedoraproject.org/fedora-minimal:38

RUN microdnf -y upgrade && microdnf -y install firewalld tuned dnsmasq NetworkManager && microdnf -y clean all
