#! /bin/bash

cp special/rsupport.Dockerfile build-rsupport/Dockerfile
cd build-rsupport/ && docker build -t rbioinfor ./

