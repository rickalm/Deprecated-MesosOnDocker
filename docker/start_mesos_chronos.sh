docker rm -f mesos-chronos

docker run -d --privileged --net=host --name=mesos-chronos \
  -e SECRET=blahblah \
  -e CHRONOS_HTTP_PORT=4400 \
  -e CHRONOS_MASTER=zk://$(hostname -i|awk '{print $1}'):2181/mesos \
  -e CHRONOS_ZK_HOSTS=$(hostname -i|awk '{print $1}'):2181 \
  mesoscloud/chronos:2.4.0-centos-7
