### Ubuntu == 16.04
### Anaconda3 == 5.1.0
### With CUDA support:
### CUDA == 9.0
### CUDNN = 7

FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn


ENV CUDA_ROOT /usr/local/cuda
ENV LD_LIBRARY_PATH /usr/lib64:$CUDA_ROOT/lib64:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
ENV PATH /usr/local/anaconda3/bin:$CUDA_ROOT/bin:$PATH

RUN apt-get update && \
	apt-get install -y build-essential

# Install Anaconda
COPY Anaconda3-5.1.0-Linux-x86_64.sh /root

RUN bash /root/Anaconda3-5.1.0-Linux-x86_64.sh -b -p /usr/local/anaconda3 && \
	rm -f /root/Anaconda3-5.1.0-Linux-x86_64.sh

# Install cudatoolkit for numba
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ && \
	conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ && \
	conda config --set show_channel_urls yes && \
	conda install -y cudatoolkit

# Add a notebook profile.
RUN mkdir -p -m 700 /root/.jupyter/ && \
	echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py && \
	echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py && \
	echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py && \
	echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py


EXPOSE 8888

CMD ["/bin/bash"]
