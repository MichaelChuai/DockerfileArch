### Ubuntu == 16.04
### Anaconda3 == 5.1.0
### Without CUDA support

FROM ubuntu:16.04

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn


ENV PATH /usr/local/anaconda3/bin:$PATH

# Install Anaconda
COPY bzip2_1.0.6-8_amd64.deb /root
COPY Anaconda3-5.1.0-Linux-x86_64.sh /root

RUN dpkg -i /root/bzip2_1.0.6-8_amd64.deb && \
	rm -f /root/bzip2_1.0.6-8_amd64.deb && \
	bash /root/Anaconda3-5.1.0-Linux-x86_64.sh -b -p /usr/local/anaconda3 && \
	rm -f /root/Anaconda3-5.1.0-Linux-x86_64.sh

# Add a notebook profile.
RUN mkdir -p -m 700 /root/.jupyter/ && \
	echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py && \
	echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888

CMD ["/bin/bash"]
