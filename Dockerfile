FROM lsiobase/mono:xenial

# set version label
ARG BUILD_DATE
ARG VERSION
ARG JACKETT_PRE_BUILD=1

LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"

COPY root/ /
COPY ./docker-entrypoint.sh /usr/local/bin/

RUN apt-get update && apt-get install -y wget curl && ln -s usr/local/bin/docker-entrypoint.sh /

ENTRYPOINT ["docker-entrypoint.sh"]

# ports and volumes
VOLUME /config /downloads
EXPOSE 9117
