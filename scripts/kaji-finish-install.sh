#!/bin/bash

if [ "$(id -u)" -ne 0 ]
  then echo "Please run as root"
  exit
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Add Apache configs
$DIR/kaji-http-config
# Reset nagvis auth
$DIR/kaji-nagvis-reset-auth
# Restarting services
$DIR/kaji-services-restart-all
# Create influx dbs
$DIR/kaji-influxdb-create-databases
# Init shinken/adagios config folder
$DIR/kaji-shinken-init-config
# Fix Nagios plugins rights
$DIR/kaji-nagiosplugins-fix
