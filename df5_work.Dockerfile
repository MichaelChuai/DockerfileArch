FROM tfdev:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install tfutil

CMD ["/bin/bash"]
