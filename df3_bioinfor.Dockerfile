### jdk == 8u161
### sratoolkit == 2.9.0
### bowtie2 == 2.3.4.1
### compiled samtools == 1.7
### igvtools == 2.3.98
### hisat2 === 2.1.0
### htseq == 0.9.1

FROM rgconda:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

ENV LD_LIBRARY_PATH /usr/local/anaconda3/lib:/usr/lib64:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
ENV JAVA_HOME /usr/local/jdk
ENV BIO_HOME /usr/local/bioinfor
ENV PATH $JAVA_HOME/bin:$PATH
ENV PATH $BIO_HOME/bin:$BIO_HOME/sratoolkit/bin:$PATH
ENV PATH $BIO_HOME/bowtie2:$PATH
ENV PATH $BIO_HOME/IGVTools:$PATH
ENV PATH $BIO_HOME/hisat2:$PATH
ENV INSTALL_DIR $BIO_HOME/bin

# Install jdk
COPY jdk-8u161-linux-x64.tar.gz /root
RUN tar -zxv -f /root/jdk-8u161-linux-x64.tar.gz -C /usr/local && \
	chown -R root:root /usr/local/jdk1.8.0_161 && \
	ln -s /usr/local/jdk1.8.0_161 /usr/local/jdk && \
	rm -f /root/jdk-8u161-linux-x64.tar.gz

# Install sratoolkit
COPY sratoolkit.2.9.0-ubuntu64.tar.gz /root
RUN mkdir -p $BIO_HOME/bin && \
	tar -zxv -f /root/sratoolkit.2.9.0-ubuntu64.tar.gz -C $BIO_HOME && \
	chown -R root:root $BIO_HOME/sratoolkit.2.9.0-ubuntu64 && \
	ln -s $BIO_HOME/sratoolkit.2.9.0-ubuntu64 $BIO_HOME/sratoolkit && \
	rm -f /root/sratoolkit.2.9.0-ubuntu64.tar.gz

# Install bowtie2
COPY bowtie2.tar.gz /root
RUN tar -zxv -f /root/bowtie2.tar.gz -C $BIO_HOME && \
	chown -R root:root $BIO_HOME/bowtie2-2.3.4.1-linux-x86_64 && \
	ln -s $BIO_HOME/bowtie2-2.3.4.1-linux-x86_64 $BIO_HOME/bowtie2 && \
	rm -f /root/bowtie2.tar.gz

# Install samtools
COPY samtools /root
RUN chown root:root /root/samtools && \
	chmod 755 /root/samtools && \
	mv /root/samtools $INSTALL_DIR/samtools

# Install igvtools
COPY IGVTools.tar.gz /root
RUN tar -zxv -f /root/IGVTools.tar.gz -C $BIO_HOME && \
	chown -R root:root $BIO_HOME/IGVTools && \
	rm -f /root/IGVTools.tar.gz

# Install hisat2
COPY hisat2-2.1.0-Linux_x86_64.tar.gz /root
RUN tar -zxv -f /root/hisat2-2.1.0-Linux_x86_64.tar.gz -C $BIO_HOME && \
	chown -R root:root $BIO_HOME/hisat2-2.1.0 && \
	ln -s $BIO_HOME/hisat2-2.1.0 $BIO_HOME/hisat2 && \
	rm -rf /root/hisat2-2.1.0-Linux_x86_64.tar.gz

# Install python packages
RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple biopython==1.71 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple reportlab==3.4.0

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple pyfaidx==0.5.3.1 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple pysam==0.14.1 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple PyVCF==0.6.8 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple gffutils==0.9 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple htseq==0.9.1

# Install UCSC tools
COPY ucsc/bedGraphPack /root
COPY ucsc/bedGraphToBigWig /root
COPY ucsc/bigBedToBed /root
COPY ucsc/bigWigMerge /root
COPY ucsc/bigWigToBedGraph /root
RUN apt install -y libkrb5-dev

RUN mv /root/bedGraphPack $INSTALL_DIR/bedGraphPack && \
	mv /root/bigWigMerge $INSTALL_DIR/bigWigMerge && \
	mv /root/bigWigToBedGraph $INSTALL_DIR/bigWigToBedGraph && \
	mv /root/bedGraphToBigWig $INSTALL_DIR/bedGraphToBigWig && \
	mv /root/bigBedToBed $INSTALL_DIR/bigBedToBed && \
	chown root:root $INSTALL_DIR/* && \
	chmod 755 $INSTALL_DIR/*

CMD ["/bin/bash"]
