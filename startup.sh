#!/bin/bash
IMAGE="mysql:5.7"
AWS_PROFILE="myprofile-lavagna-web:"
AWS_REGION="us-north-2"
AWS_ACCOUNT_ID="000000000000" 
AWS_SERVER=$AWS_ACCOUNT_ID".dkr.ecr."$AWS_REGION".amazonaws.com"
TAG="1"
TAG_LATEST=$AWS_SERVER"/"$IMAGE":latest"
echo $TAG_LATEST

aws_login(){
aws ecr get-login-password --region $AWS_REGION | \
    docker login --username AWS --password-stdin $AWS_SERVER

}

push_image_to_ECR(){
docker compose up
}

#  aws_login

# docker-compose -p noah-lavagna build

containers=$(docker images myprofile-lavagna* )
count=1
for container in $containers
do
   
#  docker tag $container $AWS_SERVER/$AWS_PROFILE$count
#  docker push $AWS_SERVER/$AWS_PROFILE$count
#   echo "Container: $container:lastest $AWS_SERVER/$AWS_PROFILE$count"
((count+=1))
done
