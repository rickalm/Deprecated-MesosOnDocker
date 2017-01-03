#! /bin/bash

docker build -t rickalm/mesos-master:0.28.1 build/mesos-master
docker build -t rickalm/mesos-slave:0.28.1 build/mesos-slave
docker build -t rickalm/mesos-marathon:0.15.1 build/mesos-marathon
docker build -t rickalm/mesos-dns:0.5.2 build/mesos-dns
