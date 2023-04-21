FROM registry.fedoraproject.org/fedora-minimal:38

RUN microdnf -y update && microdnf -y install coreos-installer butane && microdnf -y clean all

ADD create_iso.sh /scripts/create_iso.sh
ADD butane.yaml /etc/butane.yaml

CMD ["/bin/bash", "-c", "/scripts/create_iso.sh"]
