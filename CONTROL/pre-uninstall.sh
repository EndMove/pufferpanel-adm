#!/bin/sh

echo "pufferpanel-adm: --== pre-uninstall ==--"

# Environment variables
PUFFER_VERSION=$(cat "$APKG_PKG_DIR"/pufferpanel_version)
PUFFER_CONTAINER=$(docker container ls -a | grep PufferPanel | awk '{print $1}')
PUFFER_IMAGE=$(docker images | grep pufferpanel/pufferpanel | grep "$PUFFER_VERSION" | awk '{print $3}')

# Force shutdown of the container and delete it
echo "pufferpanel-adm: Stopping and removing container"
echo "pufferpanel-adm: Container Name: $PUFFER_CONTAINER"
if [ -n "$PUFFER_CONTAINER" ]; then
  docker kill "$PUFFER_CONTAINER"
  sleep 2
  docker rm -f "$PUFFER_CONTAINER"
fi

# REMOVE docker image on uninstalling & updating
echo "pufferpanel-adm: Removing docker image"
echo "pufferpanel-adm: Image ID: $PUFFER_IMAGE"
if [ -n "$PUFFER_IMAGE" ]; then
  docker rmi -f "$PUFFER_IMAGE"
fi

# Notify process of the uninstallation of the docker image and container is complete
echo "pufferpanel-adm: Container and image removed"
/usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "PufferPanel container has been removed with its image"

# Saving old Puffer data
echo "pufferpanel-adm: Saving old pufferpanel data"
# TODO auto backup system on update

exit 0