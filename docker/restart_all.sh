docker rm -f mesos-dns
docker rm -f mesos-chronos
docker rm -f mesos-marathon
docker rm -f mesos-master
docker rm -f mesos-slave
docker rm -f zookeeper

bash start_zk.sh
bash start_mesos_master.sh
bash start_mesos_slave.sh
bash start_mesos_marathon.sh
bash start_mesos_dns.sh
