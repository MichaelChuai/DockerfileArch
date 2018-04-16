### Ubuntu == 16.04
### Anaconda3 == 5.1.0
### Tensorflow == 1.7.0
### Sonnet == 1.18
### With CUDA support:
### CUDA == 9.0
### CUDNN == 7

FROM gconda:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

# Install Tensorflow
RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tensorflow-gpu==1.7.0

# Install Tensorflow-based packages
RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple dm-sonnet-gpu==1.18

# Install Utilities
RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tqdm==4.19.8

EXPOSE 6006

CMD ["/bin/bash"]
