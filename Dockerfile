FROM lsiobase/mono:xenial

# set version label
ARG BUILD_DATE
ARG VERSION=1.0
ARG JACKETT_PRE_BUILD=1

LABEL build_version="Linuxserver.io modified sclemenceau version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sclemenceau"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"

COPY root/ /

RUN chmod +x /usr/local/bin/entrypoint.sh && apt-get update && apt-get install -y wget curl

ENTRYPOINT ["entrypoint.sh"]

# ports and volumes
VOLUME /config /downloads
EXPOSE 9117
