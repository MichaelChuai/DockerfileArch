#! /bin/bash

cp gconda.Dockerfile build-conda/Dockerfile
cp rsupport.Dockerfile build-rsupport/Dockerfile
cp bioinfor.Dockerfile build-bioinfor/Dockerfile
cp tfdev.Dockerfile build-tf/Dockerfile
cp work.Dockerfile build-work/Dockerfile

cd build-conda && docker build -t gconda:5.1.0 -t gconda ./
cd ../build-rsupport/ && docker build -t rgconda:3.4.4 -t rgconda ./
cd ../build-bioinfor/ && docker build -t bioinfor ./
cd ../build-tf/ && docker build -t tfdev:1.8.0 -t tfdev ./
cd ../build-work/ && docker build -t work ./

#docker images|grep none|awk '{print $3 }' | xargs docker rmi -f
