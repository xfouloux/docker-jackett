#FROM lsiobase/mono:xenial
FROM linuxserver/jackett

COPY root/ /

RUN apt-get update && apt-get install -y wget curl unzip zip unp

# ports and volumes
VOLUME /config /downloads
EXPOSE 9117
