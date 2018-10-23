#!/bin/bash

echo "Docker Login"
bash ./docker/docker-login.sh
echo "Docker build image"
docker build -f ./docker/Dockerfile -t sf/test:$1 .
docker tag sf/test:$1 sf/test:latest
echo "Docker upload to docker hub"
docker push sf/test:$1
docker push sf/test:latest
echo "Docker Logout"
docker logout
