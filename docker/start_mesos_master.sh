docker rm -f mesos-master

docker run -d \
  -e SECRET=blahblah \
  -e MESOS_PORT=5050 \
  -e MESOS_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4/) \
  -e MESOS_ADVERTISE_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4/) \
  -e MESOS_OLDHOST=$(hostname -i|awk '{print $1}') \
  -e MESOS_ZK=zk://$(hostname -i|awk '{print $1}'):2181/mesos \
  -e MESOS_QUORUM=1 \
  -e MESOS_CLUSTER=mesos \
  -e MESOS_REGISTRY=in_memory \
  -e MESOS_LOG_DIR=/var/log/mesos \
  -e MESOS_WORK_DIR=/var/tmp/mesos \
  --net=host \
  --name=mesos-master \
  rickalm/mesos-master:0.28.1

  #mesoscloud/mesos-master:0.24.1-centos

  #-v "$(pwd)/log/mesos:/var/log/mesos" \
  #-v "$(pwd)/tmp/mesos:/var/tmp/mesos" \
