FROM tfdev:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tfutil==0.4

COPY wR.inst /root
COPY anRichment_0.82-1.tar.gz /root
RUN R --no-save < /root/wR.inst && \
	rm -f /root/wR.inst && \
	rm -f /root/anRichment_0.82-1.tar.gz

CMD ["/bin/bash"]
