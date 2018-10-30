#!/bin/bash
set -e

if [ $JACKETT_PRE_BUILD -eq 1 ]; then
  url="https://api.github.com/repos/Jackett/Jackett/releases"
else
  url="https://api.github.com/repos/Jackett/Jackett/releases/latest"
fi

echo "**** install jackett ****"
mkdir -p /app/Jackett
jack_tag=$(curl -sX GET "$url" | awk '/tag_name/{print $4;exit}' FS='[""]')
curl -o /tmp/jacket.tar.gz -L https://github.com/Jackett/Jackett/releases/download/$jack_tag/Jackett.Binaries.Mono.tar.gz
tar xf /tmp/jacket.tar.gz -C /app/Jackett --strip-components=1
echo "**** fix for host id mapping error ****
chown -R root:root /app/Jackett