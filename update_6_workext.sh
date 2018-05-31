#! /bin/bash

cp df6_workext.Dockerfile build-workext/Dockerfile

cd build-workext/ && docker build -t workext ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
