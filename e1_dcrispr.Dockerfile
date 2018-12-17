FROM gconda:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn

COPY dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl /root

COPY tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl /root


# Install Tensorflow
RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple /root/tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl && \
	rm -f /root/tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl

RUN /usr/local/anaconda3/bin/pip --no-cache-dir install /root/dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl && \
	rm -f /root/dm_sonnet-1.9-cp36-cp36m-linux_x86_64.whl

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install -i https://pypi.douban.com/simple tqdm==4.19.8

RUN	/usr/local/anaconda3/bin/pip --no-cache-dir install tfutil==0.7.6

EXPOSE 6006

CMD ["/bin/bash"]