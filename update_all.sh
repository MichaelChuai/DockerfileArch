#! /bin/bash

cp gconda.Dockerfile build-conda/Dockerfile
cp gtf.Dockerfile build-tf/Dockerfile
cp special/work.Dockerfile build-work/Dockerfile
cp special/bioinfor.Dockerfile build-bioinfor/Dockerfile
cd build-conda && docker build -t gconda:5.1.0 -t gconda ./
cd ../build-tf/ && docker build -t gtf:1.7.0 -t gtf ./
cd ../build-work/ && docker build -t work ./
cd ../build-bioinfor/ && docker build -t bioinfor ./
