docker rm -f mesos-haproxy

docker run -d --privileged --net=host --name=mesos-haproxy \
  -e MARATHON=$(hostname -i|awk '{print $1}'):8080 \
  -e ZK=$(hostname -i|awk '{print $1}'):2181 \
  mesoscloud/haproxy-marathon:0.2.1
