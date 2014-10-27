#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Prepare Shinken/Adagiosconfig folder"

# Git init /etc/shinken
if [ ! -x /etc/shinken/.git ]
then
  usermod -s /bin/bash shinken
  usermod -G www-data shinken
  cd /etc/shinken/
  #usermod -s /bin/bash www-data
  echo "[user]" > /var/www/.gitconfig
  echo "        email = adagios@kaji-project.org" >> /var/www/.gitconfig
  echo "        name = Adagios" >> /var/www/.gitconfig
  su shinken -c 'git config --global user.email "shinken@kaji-project.org"'
  su shinken -c 'git config --global user.name "shinken"'
  su shinken -c 'git init'
  su shinken -c 'git add .'
  su shinken -c 'git commit -a -m "Initial Kaji installation commit"'
  chown -R www-data:shinken /etc/shinken/
  chmod -R g+w /etc/shinken
  chgrp -R shinken /etc/shinken
fi

echo "Preparation DONE"

exit 0
