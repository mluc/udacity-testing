#!/bin/bash
set -e -x

dockerpath=myluc/udacity-devops:proj14

sudo docker system prune -f
sudo docker build -t $dockerpath .

sudo docker login --username myluc --password "$dockerhub"
sudo docker push $dockerpath
