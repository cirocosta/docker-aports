FROM alpine:3.4

RUN set -x && \
    apk upgrade --update            && \
    apk add alpine-sdk git bash     && \

    adduser -D aports               && \
    addgroup aports abuild          && \
    echo '%aports ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER aports

RUN set -x && \
    mkdir -p /home/aports/aports    && \
    git clone     \
      --depth 1   \
      --progress  \
      https://github.com/alpinelinux/aports.git \
      /home/aports/aports           && \

    abuild-keygen -n -a

ADD ./entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT [ "entrypoint" ]

