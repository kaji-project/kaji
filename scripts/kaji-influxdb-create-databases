#!/bin/bash

echo "Create user and databases influxDB"
# Create influx dbs and users
# Shinken
ret=$(curl -f -L -X GET 'http://localhost:8086/db?u=root&p=root' 2> /dev/null | grep shinken || true)
if [ "$ret" == "" ]
# shinken db doesn't exist
then
  # create Shinken database
  echo "Create Shinken Database"
  curl -X POST 'http://localhost:8086/db?u=root&p=root' -d '{"name": "shinken"}'
  ## kaji user
  curl -X POST 'http://localhost:8086/db/shinken/users?u=root&p=root' -d '{"name": "kaji", "password": "kaji"}'
  ### Set kaji user as reader only
  curl -X POST 'http://localhost:8086/db/shinken/users/shinken?u=root&p=root' -d '{ "readFrom": ".*", "writeTo": "^$" }'
  ## Shinken user
  curl -X POST 'http://localhost:8086/db/shinken/users?u=root&p=root' -d '{"name": "shinken", "password": "shinken"}'
  ## Set shinken user as writer only
  curl -X POST 'http://localhost:8086/db/shinken/users/shinken?u=root&p=root' -d '{ "readFrom": "^$", "writeTo": ".*" }'
fi
# Grafana
ret=$(curl -f -L -X GET 'http://localhost:8086/db?u=root&p=root' 2> /dev/null|grep grafana || true)
if [ "$ret" == "" ]
# grafana db doesn't exist
then
  # create Grafana database
  echo "Create Grafana Database"
  curl -X POST 'http://localhost:8086/db?u=root&p=root' -d '{"name": "grafana"}' # add database user
  ## grafana user
  curl -X POST 'http://localhost:8086/db/grafana/users?u=root&p=root' -d '{"name": "grafana", "password": "grafana"}'
fi

echo "Creatation of user and databases influxDB DONE"
exit 0
