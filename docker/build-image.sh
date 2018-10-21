#!/bin/bash

echo "Docker Login"
bash ./docker/docker-login.sh
echo "Docker build image"
docker build -f ./docker/Dockerfile -t solutionforest/project:$1 .
docker tag solutionforest/project:$1 solutionforest/project:latest
echo "Docker upload to docker hub"
docker push solutionforest/project:$1
docker push solutionforest/project:latest
echo "Docker Logout"
docker logout
