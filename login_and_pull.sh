#!/usr/bin/env bash


REPO=$(echo "$1" | awk -F /  '{print $1}')
IMAGE=$(echo "$1" | awk -F / '{print $2}')

docker image inspect $REPO/$IMAGE

if ! [ $? -eq 0 ]
then
  echo "image doesn't exist locally, logging in and pulling $1"
  aws ecr get-login-password --region $2 |  docker login --username AWS --password-stdin $REPO
  docker pull $REPO/$IMAGE
else 
  echo "image already exists, skipping"
fi
exit 0

