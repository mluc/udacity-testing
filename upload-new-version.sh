#!/bin/bash -e
eksctl version
cd ~
mkdir .aws
touch .aws/credentials
cat .aws/credentials
echo "[default]" >> .aws/credentials
echo "aws_access_key_id = $aws_access_key_id" >> .aws/credentials
echo "aws_secret_access_key = $aws_secret_access_key" >> .aws/credentials
cat .aws/credentials

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
aws s3 ls

eksctl get cluster prod2
pwd
ls -la
cat ~/.kube/config
/usr/local/bin/kubectl version
