#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Fix nagios plugins rights"

  chmod u+s /usr/lib/nagios/plugins/check_icmp
  chmod u+s /usr/lib/nagios/plugins/check_dhcp

echo "DONE"

exit 0
