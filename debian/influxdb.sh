#!/bin/bash

# create Shinken database
curl -X POST 'http://localhost:8086/db?u=root&p=root' \
  -d '{"name": "shinken"}'

# create Grafana database
curl -X POST 'http://localhost:8086/db?u=root&p=root' \
  -d '{"name": "grafanashinken"}'

# add database user
## kaji user
curl -X POST 'http://localhost:8086/db/shinken/users?u=root&p=root' \
  -d '{"name": "kaji", "password": "kaji"}'
### Set kaji user as reader only
curl -X POST 'http://localhost:8086/db/shinken/users/shinken?u=root&p=root' \
  -d '{ "readFrom": ".*", "writeTo": "^$" }'
## Shinken user
curl -X POST 'http://localhost:8086/db/shinken/users?u=root&p=root' \
  -d '{"name": "shinken", "password": "shinken"}'

## Set shinken user as writer only
curl -X POST 'http://localhost:8086/db/shinken/users/shinken?u=root&p=root' \
  -d '{ "readFrom": "^$", "writeTo": ".*" }'

# add database user
curl -X POST 'http://localhost:8086/db/grafana/users?u=root&p=root' \
  -d '{"name": "grafana", "password": "grafana"}'

# update user's password
curl -X POST 'http://localhost:8086/db/users/root?u=root&p=root' \
  -d '{"password": "kaji"}'
