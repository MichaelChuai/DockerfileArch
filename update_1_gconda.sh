#! /bin/bash

cp df1_gconda.Dockerfile build-conda/Dockerfile

cd build-conda/ && docker build -t gconda:5.1.0 -t gconda ./
