#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Setting up InfluxBD Apache reverse proxy"

# TODO PUT THAHT IN rpm
'cp' /usr/share/kaji/configs/influxdb/influxdb.conf /etc/apache2/sites-available/
#'cp' /usr/share/kaji/configs/influxdb/influxdb.conf /etc/https/sites-available/

# Enable apache mods
a2enmod proxy
a2enmod proxy_http
# Load influxdb conf
a2ensite influxdb
# reload apache2
service apache2 reload || true

echo "DONE"

exit 0
