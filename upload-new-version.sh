#!/bin/bash -e
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

eksctl get cluster prod2

#cat ~/.kube/config
#/usr/local/bin/kubectl version
