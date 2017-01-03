docker rm -f mesos-slave

docker run -d --privileged --net=host --name=mesos-slave \
  -e SECRET=blahblah \
  -e MESOS_IP=$(hostname -i|awk '{print $1}') \
  -e MESOS_HOSTNAME=$(hostname -i|awk '{print $1}') \
  -e MESOS_MASTER=zk://$(hostname -i|awk '{print $1}'):2181/mesos \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  -v /var/run/docker.sock:/var/run/docker.sock \
  rickalm/mesos-slave:0.28.1
