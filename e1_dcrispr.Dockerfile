FROM gconda:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

COPY dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl /root

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tensorflow-gpu==1.3.0

RUN /usr/local/anaconda3/bin/pip --no-cache-dir install /root/dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl && \
	rm -f /root/dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl


EXPOSE 6006

CMD ["/bin/bash"]