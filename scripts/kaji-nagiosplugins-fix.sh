#ji-influxdb-http-config.sh!/bin/bash

if [ "$(id -u)" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Fix nagios plugins rights"

if  [ $(lsb_release -is) = "Debian" ] || [ $(lsb_release -is) = "Ubuntu" ]
then
  chmod u+s /usr/lib/nagios/plugins/check_icmp
  chmod u+s /usr/lib/nagios/plugins/check_dhcp
fi
echo "DONE"

exit 0
