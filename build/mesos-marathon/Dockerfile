FROM mesosphere/marathon:v0.15.3

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/marathon/bin/start"]

VOLUME /tmp/mesos
ENV MESOS_WORK_DIR /tmp/mesos
#ENV MESOS_CONTAINERIZERS docker,mesos

COPY entrypoint.sh /

