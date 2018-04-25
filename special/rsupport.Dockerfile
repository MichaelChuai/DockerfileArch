FROM bioinfor:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

# Install R
#
#RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g; s/deb.* http:\/\/security.ubuntu.com/#&/g' /etc/apt/sources.list && \
#	echo "deb http://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list && \
#	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
#	apt-get update && \
#	apt-get install -y r-base && \

COPY openssl_1.0.2g-1ubuntu4.12_amd64.deb /root
COPY fonts-dejavu-core_2.35-1_all.deb /root
COPY libhtml-tree-perl_5.03-2_all.deb /root

RUN apt-get install -y libssl1.0.0 && \
	dpkg -i /root/openssl_1.0.2g-1ubuntu4.12_amd64.deb && \
	rm -f /root/openssl_1.0.2g-1ubuntu4.12_amd64.deb

RUN dpkg -i /root/fonts-dejavu-core_2.35-1_all.deb && \
	rm -f /root/fonts-dejavu-core_2.35-1_all.deb

RUN apt-get install -y libhtml-parser-perl libhtml-tagset-perl && \
	dpkg -i /root/libhtml-tree-perl_5.03-2_all.deb && \
	rm -f /root/libhtml-tree-perl_5.03-2_all.deb

RUN rm -rf /etc/apt/sources.list.d/* && \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
	apt-get update -o Acquire-by-hash=yes -o Acquire::https::No-Cache=True -o Acquire::http::No-Cache=True

RUN apt-get install -y bsdmainutils libxv1 r-cran-cluster

RUN apt-get install -y r-base

#RUN echo 'options("repos" = c(CRAN="http://mirrors.ustc.edu.cn/CRAN/"))' > /root/.Rprofile && \
#	echo 'options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")' >> /root/.Rprofile

CMD ["/bin/bash"]

