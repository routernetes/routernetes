FROM registry.fedoraproject.org/fedora:36

RUN dnf -y \
    update && \
    dnf -y \
    install \
    coreos-installer \
    butane \
    jq \
    curl \
    util-linux \
    cpio \
    rsync && \
    dnf -y \
    clean all

ADD create_rpi_image.sh /scripts/create_rpi_image.sh

CMD ["/bin/bash", "-c", "/scripts/create_rpi_image.sh"]
