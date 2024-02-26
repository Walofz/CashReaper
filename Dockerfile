FROM python:3.11-slim-bullseye

ARG BUILDPLATFORM BUILDOS BUILDARCH BUILDVARIANT TARGETPLATFORM TARGETOS TARGETARCH TARGETVARIANT
ARG S6_OVERLAY_VERSION=v3.1.6.2
ARG DEBIAN_FRONTEND='noninteractive'
USER root

RUN apt-get update && \
    apt-get install -y \
       apache2-utils \
       apt-file \
       apt-transport-https \
       apt-utils \
       bash \
       ca-certificates \
       coreutils \
       curl \
       iproute2 \
       libc6-arm64-cross \
       libstdc++6-arm64-cross \
       lsb-release \
       nano \
       net-tools \
       procps \
       qemu-user \
       s6 \
       wget \
       xz-utils \
       zip \
       zstd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl --fail https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz -SLo- | tar -C / -Jxpf - && \
    curl --fail https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-`uname -m| sed 's/armv7l/armhf/g'`.tar.xz -SLo- | tar -C / -Jxpf -


COPY rootfs/ /


COPY --from=packetstream/psclient:latest /usr/local/bin/ /usr/local/bin/


RUN /installer/main.sh


RUN useradd -ms /bin/bash picash


WORKDIR /opt/hg-autoclaim
RUN pip install --no-cache-dir requests
WORKDIR /root
RUN chmod 777 /etc/services.d/

ENTRYPOINT [ "/init" ]
