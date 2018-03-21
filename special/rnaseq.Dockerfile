### Ubuntu == 16.04
### Anaconda3 == 5.1.0

### jdk == 8u161
### sratoolkit == 2.9.0
### compiled samtools == 1.7
### igvtools == 2.3.98
### hisat2 === 2.1.0
### htseq == 0.9.1

FROM conda:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

ENV LD_LIBRARY_PATH /usr/local/anaconda3/lib:/usr/lib64:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

ENV JAVA_HOME /usr/local/jdk
ENV RNASEQ_HOME /usr/local/rnaseq
ENV PATH $JAVA_HOME/bin:$PATH
ENV PATH $RNASEQ_HOME/bin:$RNASEQ_HOME/sratoolkit/bin:$PATH
ENV PATH $RNASEQ_HOME/IGVTools:$PATH
ENV PATH $RNASEQ_HOME/hisat2:$PATH

COPY jdk-8u161-linux-x64.tar.gz /root
COPY sratoolkit.2.9.0-ubuntu64.tar.gz /root
COPY samtools /root
COPY IGVTools.tar.gz /root
COPY hisat2-2.1.0-Linux_x86_64.tar.gz /root

# Install jdk
RUN tar -zxv -f /root/jdk-8u161-linux-x64.tar.gz -C /usr/local && \
	chown -R root:root /usr/local/jdk1.8.0_161 && \
	ln -s /usr/local/jdk1.8.0_161 /usr/local/jdk && \
	rm -f /root/jdk-8u161-linux-x64.tar.gz

# Install sratoolkit
RUN mkdir -p $RNASEQ_HOME/bin && \
	tar -zxv -f /root/sratoolkit.2.9.0-ubuntu64.tar.gz -C $RNASEQ_HOME && \
	chown -R root:root $RNASEQ_HOME/sratoolkit.2.9.0-ubuntu64 && \
	ln -s $RNASEQ_HOME/sratoolkit.2.9.0-ubuntu64 $RNASEQ_HOME/sratoolkit && \
	rm -f /root/sratoolkit.2.9.0-ubuntu64.tar.gz

# Install samtools
RUN chown root:root /root/samtools && \
	chmod 755 /root/samtools && \
	mv /root/samtools $RNASEQ_HOME/bin

# Install igvtools
RUN tar -zxv -f /root/IGVTools.tar.gz -C $RNASEQ_HOME && \
	chown -R root:root $RNASEQ_HOME/IGVTools && \
	rm -f /root/IGVTools.tar.gz

# Install hisat2
RUN tar -zxv -f /root/hisat2-2.1.0-Linux_x86_64.tar.gz -C $RNASEQ_HOME && \
	chown -R root:root $RNASEQ_HOME/hisat2-2.1.0 && \
	ln -s $RNASEQ_HOME/hisat2-2.1.0 $RNASEQ_HOME/hisat2 && \
	rm -rf /root/hisat2-2.1.0-Linux_x86_64.tar.gz

# Install htseq
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple htseq==0.9.1


CMD ["/bin/bash"]
