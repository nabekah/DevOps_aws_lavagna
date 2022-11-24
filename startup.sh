#!/bin/bash
IMAGE="mysql:5.7"
AWS_PROFILE="noah-lavagna-app:latest"
AWS_REGION="us-west-2"
AWS_ACCOUNT_ID="644435390668" 
AWS_SERVER=$AWS_ACCOUNT_ID".dkr.ecr."$AWS_REGION".amazonaws.com"
TAG_LATEST=$AWS_SERVER"/"$IMAGE":latest"
echo $TAG_LATEST

aws_login(){
aws ecr get-login-password --region $AWS_REGION | \
    docker login --username AWS --password-stdin $AWS_SERVER

}

push_image_to_ECR(){
docker compose up
}

# aws_login
docker-compose -p noah-lavagna build
containers=$(docker images noah-lavagna* -q)
for container in $containers
do
  echo "Container: $container"
done
