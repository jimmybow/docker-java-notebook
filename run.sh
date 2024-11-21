#!/bin/bash
export host_docker_internal=$(  docker network inspect bridge-network -f '{{(index .IPAM.Config 0).Gateway}}'  )

docker compose stop
docker compose rm -f
docker compose up -d
