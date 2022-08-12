#!/bin/sh

echo "pufferpanel-adm: --== post-install ==--"

# Environment variables
PUFFER_VERSION=$(cat "$APKG_PKG_DIR"/pufferpanel_version)
PUFFER_DATA_PATH='/volume1/Docker/PufferPanel'
PUFFER_CONTAINER=PufferPanel

# Installing & creating the container
echo "pufferpanel-adm: Creating container"
/usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "Creating PufferPanel container"
docker create -i -t --name=$PUFFER_CONTAINER \
  --net=host \
  # --publish 3300:8080 \
  # --publish 5657:5657 \
  # --publish 25565-25675:25565-25675 \
  # --publish 19132-19143:19132-19143/udp \
  # --publish 27016-27027:27016-27027 \
  # --publish 30121-30132:30121-30132 \
  --volume /usr/builtin/etc/certificate/:/ssl/:ro \
  --volume $PUFFER_DATA_PATH:/etc/pufferpanel \
  --volume $PUFFER_DATA_PATH:/var/lib/pufferpanel \
  --restart=unless-stopped \
  pufferpanel/pufferpanel:"$PUFFER_VERSION"

# Starting container
docker start $PUFFER_CONTAINER

# Update/Install
if [ "$APKG_PKG_STATUS" = "install" ]; then
  # Create default user on first run after install
  echo "pufferpanel-adm: Creating PufferPanel default user..."
  docker exec -i $PUFFER_CONTAINER /pufferpanel/pufferpanel user add --admin --email admin@admin.com --name admin --password admin2000
  # Say installation is complete
  echo "pufferpanel-adm: PufferPanel installation done!"
  /usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "PufferPanel installation is done"
elif [ "$APKG_PKG_STATUS" = "upgrade" ]; then
  # Say upgrade is complete
  echo "pufferpanel-adm: PufferPanel upgrade is done."
  /usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "PufferPanel upgrade is done"
fi

exit 0