FROM registry.fedoraproject.org/fedora-minimal:36

RUN microdnf -y update && microdnf -y install coreos-installer butane && microdnf -y clean all

ADD create_iso.sh /scripts/create_iso.sh

CMD ["/bin/bash", "-c", "/scripts/create_iso.sh"]
