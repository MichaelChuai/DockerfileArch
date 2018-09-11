### Ubuntu == 16.04
### Anaconda3 == 5.1.0
### CUDA == 9.0
### CUDNN == 7

FROM gym:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

# Install Tensorflow
RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tensorflow-gpu==1.10.1

# Install Tensorflow-based packages
RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple dm-sonnet-gpu==1.23

# Install Utilities
RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tqdm==4.19.8




EXPOSE 6006

CMD ["/bin/bash"]
