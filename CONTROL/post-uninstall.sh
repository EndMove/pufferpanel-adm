#!/bin/sh

echo "pufferpanel-adm: --== post-uninstall ==--"

# Environment variables
PUFFER_DATA_PATH='/share/Docker/PufferPanel'

# Remove the PufferPanel data on uninstall
if [ "$APKG_PKG_STATUS" = "uninstall" ]; then
  echo "pufferpanel-adm: Removing PufferPanel data..."
  rm -rf $PUFFER_DATA_PATH
  echo "pufferpanel-adm: PufferPanel data removed."
  /usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "PufferPanel has been uninstalled with all it's data"
fi

exit 0