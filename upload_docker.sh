dockerpath=myluc/udacity-devops:proj5


echo "Docker ID and Image: $dockerpath"kubectl get services -o wide
sudo docker login --username myluc --password f6639a23-60c7-4c8b-8683-599ab8ae4332
sudo docker tag project5 $dockerpath

sudo docker push $dockerpath
