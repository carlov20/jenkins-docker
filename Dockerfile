FROM jenkins
USER root
RUN apt-get update \
	&& apt-get install -y sudo supervisor \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl -sSL https://get.docker.com/ | sh \
	&& usermod -aG docker jenkins \
	&& mkdir -p /var/log/supervisor \
	&& mkdir -p /var/log/jenkins

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
