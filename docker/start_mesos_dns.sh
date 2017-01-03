docker rm -f mesos-dns

docker run -d -P --net=host --name=mesos-dns \
  -e SECRET=blahblah \
  -e MESOS_MASTER=$(hostname -i|awk '{print $1}'):5050 \
  -e MESOS_ZK=zk://$(hostname -i|awk '{print $1}'):2181/mesos \
  rickalm/mesos-dns:0.5.2
