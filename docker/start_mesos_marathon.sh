docker rm -f mesos-marathon

docker run -d --privileged --net=host --name=mesos-marathon \
  -e SECRET=blahblah \
  -e MARATHON_HTTP_ADDRESS=$(hostname -i|awk '{print $1}') \
  -e MARATHON_HTTPS_ADDRESS=$(hostname -i|awk '{print $1}') \
  -e MARATHON_MASTER=zk://$(hostname -i|awk '{print $1}'):2181/mesos \
  -e MARATHON_ZK=zk://$(hostname -i|awk '{print $1}'):2181/marathon \
  mesoscloud/marathon:0.11.0-centos-7
