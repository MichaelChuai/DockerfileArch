FROM gconda:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

ENV BIO_HOME /usr/local/bioinfor
ENV PATH $BIO_HOME/bowtie2:$PATH
ENV PATH $BIO_HOME/circos/bin:$PATH
ENV INSTALL_DIR $BIO_HOME/bin

# Install bowtie2
COPY bowtie2.tar.gz /root
RUN mkdir -p $BIO_HOME/bin && \
	tar -zxv -f /root/bowtie2.tar.gz -C $BIO_HOME && \
	chown -R root:root $BIO_HOME/bowtie2-2.3.4.1-linux-x86_64 && \
	ln -s $BIO_HOME/bowtie2-2.3.4.1-linux-x86_64 $BIO_HOME/bowtie2 && \
	rm -f /root/bowtie2.tar.gz

# Install Tensorflow
COPY dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl /root
COPY tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl /root

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple /root/tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl && \
	rm -f /root/tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl

RUN /usr/local/anaconda3/bin/pip --no-cache-dir install /root/dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl && \
	rm -f /root/dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl


RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tqdm==4.19.8 pyfaidx==0.5.3.1

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install tfutil==0.7.6


# Install Circos
COPY circos-0.69-6.tgz /root
COPY MyConfig.pm /root
RUN tar -zxv -f /root/circos-0.69-6.tgz -C $BIO_HOME && \
	chown -R root:root $BIO_HOME/circos-0.69-6 && \
	ln -s $BIO_HOME/circos-0.69-6 $BIO_HOME/circos && \
	rm -f /root/circos-0.69-6.tgz

RUN mkdir -p /root/.cpan/CPAN/ && \
	mv /root/MyConfig.pm /root/.cpan/CPAN/

RUN apt-get update
RUN apt-get install -y libgd-dev
RUN apt-get install -y libgd-perl && \
	cpan -i Font::TTF::Font && \
	cpan -i Config::General && \
	cpan -i Clone && \
	cpan -i Math::Bezier && \
	cpan -i List::MoreUtils && \
	cpan -i Regexp::Common && \
	cpan -i Math::Round && \
	cpan -i Math::VecStat && \
	cpan -i Readonly && \
	cpan -i Params::Validate && \
	cpan -i SVG && \
	cpan -i Statistics::Basic && \
	cpan -i Set::IntSpan && \
	cpan -i Text::Format


EXPOSE 6006

CMD ["/bin/bash"]