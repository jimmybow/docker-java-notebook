#!/bin/bash

docker compose pull
docker compose stop
docker compose rm -f
docker compose up -d
docker image prune -f
