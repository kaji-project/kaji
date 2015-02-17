#!/bin/bash

if [ "$(id -u)" -ne 0 ]
  then echo "Please run as root"
  exit
fi


if  [ $(lsb_release -is) = "Debian" ] || [ $(lsb_release -is) = "Ubuntu" ] 
then
    'cp' /usr/share/kaji/configs/influxdb/influxdb.conf /etc/apache2/sites-available/
    # Enable apache mods
    a2enmod proxy
    a2enmod proxy_http
    # Load influxdb conf
    echo "Setting up InfluxBD Apache reverse proxy"
    a2ensite influxdb || true
    # Load adagios conf
    echo "Setting up Adagios in Apache"
    a2ensite adagios || true
    # Load grafana conf
    echo "Setting up Grafana in Apache"
    a2ensite grafana || true 
    # Load grafana-admin conf
    echo "Setting up Grafana-admin in Apache"
    a2ensite grafana-admin || true
    # Load nagvis conf
    echo "Setting up NagvisD in Apache"
    a2ensite nagvis || true
    # reload apache2
    service apache2 reload || true
else
    'cp' /usr/share/kaji/configs/influxdb/influxdb.conf /etc/https/sites-available/
    # reload apache2
    service httpd reload || true
fi

echo "DONE"

exit 0
