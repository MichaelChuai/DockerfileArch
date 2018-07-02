#! /bin/bash

cp df1_gconda_ext.Dockerfile build-conda/Dockerfile

cd build-conda/ && docker build -t gconda:5.2.0 -t gconda ./
