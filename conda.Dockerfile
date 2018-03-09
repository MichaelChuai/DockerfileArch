### Ubuntu == 16.04
### Anaconda3 == 5.1.0
### Without CUDA support

FROM ubuntu:16.04

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

RUN apt-get update && apt-get install -y bzip2

ENV PATH /usr/local/anaconda3/bin:$PATH

# Install Anaconda
COPY Anaconda3-5.1.0-Linux-x86_64.sh /root

RUN bash /root/Anaconda3-5.1.0-Linux-x86_64.sh -b -p /usr/local/anaconda3 && \
	rm -f /root/Anaconda3-5.1.0-Linux-x86_64.sh

CMD ["/bin/bash"]
