#!/bin/bash -e
echo "${secrets.aws_access_key_id}"
pwd
ls -la
cat ~/.kube/config
/usr/local/bin/kubectl version
