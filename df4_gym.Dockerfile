FROM bioinfor:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn


# Install gym
RUN apt-get update && apt-get install -y cmake libfribidi0 libwebp5 libhwloc5 libtool libmp3lame0 libzvbi0 libasound2 libdrm-intel1 libboost-all-dev x11proto-record-dev libgl1-mesa-glx

RUN apt-get install -y zlib1g-dev libjpeg-dev libopenblas-base libatlas-dev

RUN apt-get install -y xorg-dev xvfb swig

RUN apt-get install -y libav-tools libsdl2-dev

RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple PyOpenGL piglet pyglet==1.2.4

RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple gym[all]
