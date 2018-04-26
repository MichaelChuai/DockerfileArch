FROM rbioinfor:latest

MAINTAINER MichaelChuai 18alexanderm117@tongji.edu.cn


COPY rstudio-server-1.1.447-amd64.deb /root

RUN apt-get install -y gdebi-core

RUN gdebi -n /root/rstudio-server-1.1.447-amd64.deb && \
	rm -f /root/rstudio-server-1.1.447-amd64.deb && \
	echo "auth-minimum-user-id=0" >> /etc/rstudio/rserver.conf && \
	echo "server-daemonize=0" >> /etc/rstudio/rserver.conf && \
	echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf && \
	echo root:root | chpasswd

EXPOSE 8787

CMD ["/bin/bash"]

