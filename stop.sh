#!/bin/bash

docker compose stop
docker compose rm -f

#docker ps -a | grep 'jenkins$' | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

#docker run \
#    --name jenkins \
#    -v /opt/docker/jenkins-docker/data/jenkins:/var/jenkins_home \
#    -v /var/run/docker.sock:/var/run/docker.sock \
#    -e TIME_ZONE=Asia/Taipei \
#    -e LETSENCRYPT_EMAIL=anthonywang@bluetechnology.com.tw \
#    -e LETSENCRYPT_HOST=jenkins.bluetechnology.cc \
#    -e VIRTUAL_HOST=jenkins.bluetechnology.cc \
#    -e VIRTUAL_PORT=8080 \
#    -e HTTPS_METHOD=redirect \
#    -d \
#    --network bridge-network \
#    anthonywang/jenkins:latest

