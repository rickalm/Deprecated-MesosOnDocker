FROM mesosphere/mesos-master:0.28.1

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/mesos-master"]

VOLUME /tmp/mesos
ENV MESOS_WORK_DIR /tmp/mesos
#ENV MESOS_CONTAINERIZERS docker,mesos

COPY entrypoint.sh /

