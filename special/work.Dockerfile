FROM gtf

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple pyfaidx

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tfutil==0.3.3

CMD ["/bin/bash"]
