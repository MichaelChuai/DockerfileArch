#! /bin/bash

cp tfdev.Dockerfile build-tf/Dockerfile
cp work.Dockerfile build-work/Dockerfile

cd build-tf/ && docker build -t tfdev:1.8.0 -t tfdev ./
cd ../build-work/ && docker build -t work ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
