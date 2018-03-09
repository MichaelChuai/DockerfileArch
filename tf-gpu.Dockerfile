### Ubuntu == 16.04
### Anaconda3 == 5.1.0
### Tensorflow == 1.6.0
### Sonnet == 1.17
### With CUDA support:
### CUDA == 9.0
### CUDNN = 7

FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

RUN apt-get update && apt-get install -y bzip2

ENV CUDA_ROOT /usr/local/cuda
ENV LD_LIBRARY_PATH /usr/lib64:$CUDA_ROOT/lib64:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
ENV PATH /usr/local/anaconda3/bin:$CUDA_ROOT/bin:$PATH

# Install Anaconda
COPY Anaconda3-5.1.0-Linux-x86_64.sh /root

RUN bash /root/Anaconda3-5.1.0-Linux-x86_64.sh -b -p /usr/local/anaconda3 && \
	rm -f /root/Anaconda3-5.1.0-Linux-x86_64.sh

# Install dependencies
RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.tuna.tsinghua.edu.cn/simple progress==1.3

# Install Tensorflow
RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.tuna.tsinghua.edu.cn/simple tensorflow-gpu==1.6.0

# Install Tensorflow-based packages
RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.tuna.tsinghua.edu.cn/simple dm-sonnet-gpu==1.17

EXPOSE 6006

CMD ["/bin/bash"]
