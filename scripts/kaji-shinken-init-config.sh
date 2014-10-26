#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Prepare Shinken/Adagiosconfig folder"

# Git init /etc/shinken
if [ ! -x /etc/shinken/.git ]
then
  chown -R shinken:shinken /etc/shinken/
  usermod -s /bin/bash shinken
  usermod -G shinken www-data
  chgrp -R www-data /etc/shinken
  chmod -R g+w /etc/shinken
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
fi

echo "Preparation DONE"

exit 0
