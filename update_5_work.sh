#! /bin/bash

cp df5_work.Dockerfile build-work/Dockerfile

cd build-work/ && docker build -t work ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
