#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Restarting all necessary services for Kaji"

echo "Restarting InfluxDB"
service influxdb restart || echo "Failed to restart Influxdb. You have to restart Shinken to update its configuration"

echo "Restarting Apache"
service apache2 restart || echo "Failed to restart Apache2. You have to restart Apache2 to update its configuration"

echo "Restarting Shinken"
service shinken restart || echo "Failed to restart Shinken. You have to restart Shinken to update its configuration"

echo "Restarting DONE"

exit 0
