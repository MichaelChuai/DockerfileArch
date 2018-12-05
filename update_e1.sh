#! /bin/bash

cp e1_dcrispr.Dockerfile build-e1/Dockerfile

cd build-e1/ && docker build -t dcrispr ./
