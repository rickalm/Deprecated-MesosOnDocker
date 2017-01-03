FROM ubuntu:14.04

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get -y update && \
  apt-get -y install wget && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget -O /mesos-dns https://github.com/mesosphere/mesos-dns/releases/download/v0.5.2/mesos-dns-v0.5.2-linux-amd64
RUN chmod +x /mesos-dns

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/mesos-dns","-config","/config.json"]

COPY entrypoint.sh /

