FROM gtf

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

RUN apt-get update && \
	apt-get install -y gcc

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tfutil==0.4

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple biopython==1.71 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple reportlab==3.4.0


RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple pyfaidx==0.5.3.1 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple pysam==0.14.1 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple PyVCF==0.6.8 && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple gffutils==0.9


CMD ["/bin/bash"]
