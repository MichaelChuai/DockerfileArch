#! /bin/bash

cp work.Dockerfile build-work/Dockerfile

cd build-work/ && docker build -t work ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
