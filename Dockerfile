FROM alpine:3.4

RUN set -x && \
    apk upgrade --update && \
    apk add alpine-sdk git 

RUN set -x && \
    adduser -D devuser  && \
    addgroup devuser abuild  && \
    echo '%devuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER devuser
WORKDIR /home/devuser

RUN set -x && \
    git clone \
      --depth 1 \
      --progress \
      https://github.com/alpinelinux/aports.git 

RUN set -x && \
    abuild-keygen -n -a


