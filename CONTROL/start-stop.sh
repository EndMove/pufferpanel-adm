#!/bin/sh

# Environment variable
PUFFER_CONTAINER=PufferPanel

case "$1" in
  start)
    # Starting pufferpanel
    echo "pufferpanel-adm: Starting service..."
    docker start $PUFFER_CONTAINER
    /usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "PufferPanel has been started"
    sleep 3
    ;;
  stop)
    # Stopping pufferpanel
    echo "pufferpanel-adm: Stopping service..."
    docker stop $PUFFER_CONTAINER
    /usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "PufferPanel has been stopped"
    sleep 3
    ;;
  reload)
    # Reloading pufferpanel
    echo "pufferpanel-adm: Reloading service..."
    docker stop $PUFFER_CONTAINER
    sleep 6
    docker start $PUFFER_CONTAINER
    /usr/sbin/syslog --log 0 --level 0 --user "PufferPanel-ADM" --event "PufferPanel has been reloaded"
    sleep 3
    ;;
  *)
    echo "usage: $0 {start|stop|reload}"
    exit 1
    ;;
esac

exit 0