FROM conda:latest

MAINTAINER MichaelChuai

ENV LD_LIBRARY_PATH /usr/local/anaconda3/lib:/usr/lib64:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
ENV SOURCE_URL "http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64"
ENV INSTALL_DIR="/usr/local/bin"

# Install Dependencies
RUN apt update && \
	apt install -y libkrb5-dev

COPY samtools /root

# Install samtools
RUN chown root:root /root/samtools && \
	chmod 755 /root/samtools && \
	mv /root/samtools $INSTALL_DIR/

RUN curl $SOURCE_URL/bedGraphPack -o $INSTALL_DIR/bedGraphPack && \
	chmod 755 $INSTALL_DIR/bedGraphPack && \
	curl $SOURCE_URL/bigWigMerge -o $INSTALL_DIR/bigWigMerge && \
	chmod 755 $INSTALL_DIR/bigWigMerge && \
	curl $SOURCE_URL/bigWigToBedGraph -o $INSTALL_DIR/bigWigToBedGraph && \
	chmod 755 $INSTALL_DIR/bigWigToBedGraph && \
	curl $SOURCE_URL/bedGraphToBigWig -o $INSTALL_DIR/bedGraphToBigWig && \
	chmod 755 $INSTALL_DIR/bedGraphToBigWig && \
	curl $SOURCE_URL/bigBedToBed -o $INSTALL_DIR/bigBedToBed && \
	chmod 755 $INSTALL_DIR/bigBedToBed

CMD ["/bin/bash"]
