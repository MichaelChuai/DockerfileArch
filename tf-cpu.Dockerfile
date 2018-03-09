### Ubuntu == 16.04
### Anaconda3 == 5.1.0
### Tensorflow == 1.6.0
### Sonnet == 1.17
### Without CUDA support

FROM conda:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn


# Install dependencies
RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.tuna.tsinghua.edu.cn/simple progress==1.3

# Install Tensorflow
RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.tuna.tsinghua.edu.cn/simple tensorflow==1.6.0

# Install Tensorflow-based packages
RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.tuna.tsinghua.edu.cn/simple dm-sonnet==1.17

EXPOSE 6006

CMD ["/bin/bash"]
