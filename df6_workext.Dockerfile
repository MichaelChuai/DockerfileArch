FROM work:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple torch && \
	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple torchvision


CMD ["/bin/bash"]
