FROM lsiobase/mono:xenial

# set version label
ARG BUILD_DATE=30.10.18
ARG VERSION=1.1
ARG JACKETT_PRE_BUILD=1
ARG JACKETT_NO_UPDATES=0

LABEL build_version="Linuxserver.io modified sclemenceau version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sclemenceau"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"

COPY root/ /

RUN apt-get update && apt-get install -y wget curl

# ports and volumes
VOLUME /config /downloads
EXPOSE 9117
