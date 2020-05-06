#!/bin/bash
set -e -x
eksctl version

mkdir ~/.aws
touch ~/.aws/credentials
echo "[default]" >> ~/.aws/credentials
echo "aws_access_key_id = $aws_access_key_id" >> ~/.aws/credentials
echo "aws_secret_access_key = $aws_secret_access_key" >> ~/.aws/credentials

pwd
ls -la

mkdir ~/.kube
touch ~/.kube/config
cp kube_config ~/.kube/config
cat ~/.kube/config

eksctl get cluster -n prod2 -r us-east-1 -p default

kubectl apply -f project5-deployment.yaml
#kubectl apply -f project5-service.yaml

sleep 10

kubectl get deployments
kubectl get replicasets
kubectl describe replicasets
kubectl get services my-service
kubectl describe services my-service
kubectl get pods --output=wide

docker ps
docker images

#kubectl set image deployments/hello-world-project5 hello-world-project5=myluc/project5:V1
#sleep 10
#kubectl rollout status deployments/hello-world-project5
#
#kubectl get deployments
#kubectl get replicasets
#kubectl describe replicasets
#kubectl get services my-service
#kubectl describe services my-service
#kubectl get pods --output=wide
