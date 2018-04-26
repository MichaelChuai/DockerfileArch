#! /bin/bash

cp special/rstudio.Dockerfile build-rstudio/Dockerfile
cd build-rstudio/ && docker build -t rsbioinfor ./

