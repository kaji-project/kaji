#!/bin/bash

if [ "$(id -u)" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Prepare Shinken/Adagiosconfig folder"

# Git init /etc/shinken
if [ ! -x /etc/shinken/.git ]
then
  usermod -s /bin/bash shinken
  chown -R shinken:shinken /etc/shinken/
  cd /etc/shinken/
  su shinken -c 'git config --global user.email "shinken@kaji-project.org"'
  su shinken -c 'git config --global user.name "shinken"'
  su shinken -c 'git init'
  su shinken -c 'git add .'
  su shinken -c 'git commit -a -m "Initial Kaji installation commit"'
fi

echo "Preparation DONE"

exit 0
