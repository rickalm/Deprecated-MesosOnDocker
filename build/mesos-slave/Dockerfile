FROM mesosphere/mesos-slave:0.28.1

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/mesos-slave"]

VOLUME /tmp/mesos
ENV MESOS_WORK_DIR /tmp/mesos
ENV MESOS_CONTAINERIZERS docker,mesos

RUN apt-get update && apt-get install curl && apt-get clean
RUN curl -fLsS https://get.docker.com/ | sh

COPY entrypoint.sh /

