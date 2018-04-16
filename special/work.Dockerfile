FROM gtf

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

RUN /usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple progress==1.3

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tfutil==0.3.3

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple pyfaidx

#biopython (1.71)
#pysam (0.14.1)
#PyVCF (0.6.8)
#tqdm (4.19.8)

CMD ["/bin/bash"]
