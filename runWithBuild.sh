#!/bin/bash

docker compose stop
docker compose rm -f
docker compose up -d --build --force-recreate --no-deps -V
docker image prune -f
