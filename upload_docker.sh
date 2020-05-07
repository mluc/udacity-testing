dockerpath=myluc/udacity-devops:proj6


echo "Docker ID and Image: $dockerpath"
sudo docker login --username myluc --password "$dockerhub"
sudo docker tag project6 $dockerpath

sudo docker push $dockerpath
