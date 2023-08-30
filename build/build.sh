#!/bin/bash

docker build . -t="java-notebook:java11"
docker image prune -f