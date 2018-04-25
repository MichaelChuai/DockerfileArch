FROM bioinfor:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

# Install R

COPY openssl_1.0.2g-1ubuntu4.12_amd64.deb /root
COPY biocLite.R /root
COPY R.inst /root

RUN apt-get install -y libssl1.0.0 && \
	dpkg -i /root/openssl_1.0.2g-1ubuntu4.12_amd64.deb && \
	rm -f /root/openssl_1.0.2g-1ubuntu4.12_amd64.deb

RUN rm -rf /etc/apt/sources.list.d/* && \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
	apt-get update -o Acquire-by-hash=yes -o Acquire::https::No-Cache=True -o Acquire::http::No-Cache=True

RUN apt-get install -y bsdmainutils libxv1 r-cran-cluster libhtml-form-perl fonts-dejavu-core

RUN apt-get install -y r-base

RUN echo 'options("repos" = c(CRAN="http://mirrors.ustc.edu.cn/CRAN/"))' > /root/.Rprofile && \
	echo 'options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")' >> /root/.Rprofile

RUN R --no-save < /root/R.inst && \
	rm -f /root/biocLite.R && \
	rm -f /root/R.inst


CMD ["/bin/bash"]

