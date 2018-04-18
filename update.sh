#! /bin/bash

cp special/work.Dockerfile build-work/Dockerfile
cp special/bioinfor.Dockerfile build-bioinfor/Dockerfile
cd build-work/ && docker build -t work ./
cd ../build-bioinfor/ && docker build -t bioinfor ./
