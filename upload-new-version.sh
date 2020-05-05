#!/bin/bash -e
eksctl version
mkdir ~/.aws
touch ~/.aws/credentials
cat ~/.aws/credentials
echo "[default]" >> ~/.aws/credentials
echo "$aws_access_key_id" >> ~/.aws/credentials
cat ~/.aws/credentials
pwd
ls -la
cat ~/.kube/config
/usr/local/bin/kubectl version
