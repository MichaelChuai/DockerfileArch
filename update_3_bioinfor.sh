#! /bin/bash

cp df3_bioinfor.Dockerfile build-bioinfor/Dockerfile

cd build-bioinfor/ && docker build -t bioinfor ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
