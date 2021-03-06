#!/bin/bash
set -e -x
eksctl version

mkdir ~/.aws
touch ~/.aws/credentials
echo "[default]" >> ~/.aws/credentials
echo "aws_access_key_id = $aws_access_key_id" >> ~/.aws/credentials
echo "aws_secret_access_key = $aws_secret_access_key" >> ~/.aws/credentials

mkdir ~/.kube
touch ~/.kube/config
cp kube_config ~/.kube/config
cat ~/.kube/config

eksctl get cluster -n prod2 -r us-east-1 -p default

kubectl apply -f project5-deployment.yaml -f project5-service.yaml

sleep 10

kubectl get deployments
kubectl get replicasets
kubectl describe replicasets
kubectl get services my-service
kubectl describe services my-service
kubectl get pods --output=wide

sudo docker ps
sudo docker images
