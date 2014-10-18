#!/bin/bash

# create Shinken database
curl -X POST 'http://localhost:8086/db?u=root&p=root' \
  -d '{"name": "shinken"}'

# create Grafana database
curl -X POST 'http://localhost:8086/db?u=root&p=root' \
  -d '{"name": "grafanashinken"}'

# add database user
curl -X POST 'http://localhost:8086/db/shinken/users?u=root&p=root' \
  -d '{"name": "shinken", "password": "shinken"}'

curl -X POST 'http://localhost:8086/db/shinken/users/shinken?u=root&p=root' \
  -d '{ "readFrom": "^$", "writeTo": ".*" }'

# add database user
curl -X POST 'http://localhost:8086/db/grafana/users?u=root&p=root' \
  -d '{"name": "grafana", "password": "grafana"}'

# update user's password
curl -X POST 'http://localhost:8086/db/users/root?u=root&p=root' \
  -d '{"password": "kaji"}'
