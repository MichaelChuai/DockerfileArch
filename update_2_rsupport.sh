#! /bin/bash

cp df2_rsupport.Dockerfile build-rsupport/Dockerfile

cd build-rsupport/ && docker build -t rgconda:3.4.4 -t rgconda ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
