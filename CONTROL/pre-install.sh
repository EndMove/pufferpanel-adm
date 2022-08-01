#!/bin/sh

echo "pufferpanel-adm: --== pre-install ==--"

# Environment variables
PUFFER_VERSION=$(cat "$APKG_PKG_DIR"/pufferpanel_version)

# Fetching the container image
echo "pufferpanel-adm: Fetching image"
/usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "Fetching PufferPanel image"
docker pull pufferpanel/pufferpanel:"$PUFFER_VERSION"

exit 0