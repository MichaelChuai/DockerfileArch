FROM bioinfor:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

# Install R

COPY libssl1.0.0_1.0.2g-1ubuntu4_amd64.deb /root
COPY openssl_1.0.2g-1ubuntu4.12_amd64.deb /root
COPY biocLite.R /root
COPY R.inst /root

RUN dpkg -i /root/libssl1.0.0_1.0.2g-1ubuntu4_amd64.deb && \
	dpkg -i /root/openssl_1.0.2g-1ubuntu4.12_amd64.deb && \
	rm -f /root/openssl_1.0.2g-1ubuntu4.12_amd64.deb && \
	rm -f /root/libssl1.0.0_1.0.2g-1ubuntu4_amd64.deb

RUN apt-get install -y libhtml-parser-perl libxcb1 bsdmainutils libxv1 libhtml-form-perl fonts-dejavu-core libhtml-tree-perl libpaper1 && \
	apt-get install -y xauth libx11-xcb1 libjbig0 bzip2-doc m4 shared-mime-info autotools-dev automake libfile-desktopentry-perl && \
	apt-get install -y libcroco3 libtinfo-dev pkg-config libelf1 libedit2 libdatrie1 libsensors4 libncurses5-dev libdrm2 && \
	apt-get install -y libdrm-intel1 libgl1-mesa-glx libsasl2-2 libbz2-dev && \
	apt-get install -y libxshmfence1 intltool libpcre32-3 zlib1g-dev && \
	apt-get install -y python2.7 libdbus-1-3 && \
	apt-get install -y libpcre3-dev libxmu6 && \
	apt-get install -y libpng12-0 && \
	apt-get install -y libx11-protocol-perl x11-utils && \
	apt-get install -y libsys-hostname-long-perl

RUN rm -rf /etc/apt/sources.list.d/* && \
	sed -i 's/deb-src/# dev-src/g; s/deb http:\/\/archive.ubuntu.com/deb http:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
	apt-get update -o Acquire-by-hash=yes -o Acquire::https::No-Cache=True -o Acquire::http::No-Cache=True

RUN apt-get install -y r-base

RUN echo 'options("repos" = c(CRAN="http://mirrors.ustc.edu.cn/CRAN/"))' > /root/.Rprofile && \
	echo 'options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")' >> /root/.Rprofile

RUN R --no-save < /root/R.inst && \
	rm -f /root/biocLite.R && \
	rm -f /root/R.inst


CMD ["/bin/bash"]

