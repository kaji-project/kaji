#!/bin/bash

if [ "$(id -u)" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Reset Nagvis Authentication file"

mkdir -p /etc/nagvis/
'cp' /usr/share/kaji/configs/nagvis/auth.db /etc/nagvis/

if  [ $(lsb_release -is) = "Debian" ] || [ $(lsb_release -is) = "Ubuntu" ]
then
    chown www-data:www-data /etc/nagvis/auth.db
else
    chown apache:apache /etc/nagvis/auth.db
fi

echo "Reset Done"

exit 0
