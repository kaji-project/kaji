#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Reset Nagvis Authentication file"

mkdir -p /etc/nagvis/
'cp' /usr/share/kaji/configs/nagvis/auth.db /etc/nagvis/
chown www-data:www-data /etc/nagvis/auth.db 

echo "Reset Done

exit 0
