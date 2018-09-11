#! /bin/bash

cp df4_gym.Dockerfile build-gym/Dockerfile

cd build-gym/ && docker build -t gym ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
