FROM bioinfor:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

# Install R
# s/archive.ubuntu.com/cn.archive.ubuntu.com/g;
RUN sed -i 's/deb.* http:\/\/security.ubuntu.com/#&/g' /etc/apt/sources.list && \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
	apt-get update && \
	apt-get install -y r-base && \
	apt-get clean && apt-get update --fix-missing && \
	apt-get install -y r-base


