#!/bin/bash -e
eksctl version
pwd
ls -la

cd ~
mkdir .aws
touch .aws/credentials
cat .aws/credentials
echo "[default]" >> .aws/credentials
echo "aws_access_key_id = $aws_access_key_id" >> .aws/credentials
echo "aws_secret_access_key = $aws_secret_access_key" >> .aws/credentials
cat .aws/credentials

echo "$HOME"

pwd
ls -la
cd ..
ls -la

#eksctl get cluster prod2

#cat ~/.kube/config
#/usr/local/bin/kubectl version
