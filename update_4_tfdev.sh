#! /bin/bash

cp df4_tfdev.Dockerfile build-tf/Dockerfile

cd build-tf/ && docker build -t tfdev:1.10.1 -t tfdev ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
