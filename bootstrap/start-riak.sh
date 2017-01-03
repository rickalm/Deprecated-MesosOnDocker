docker run -P -d \
  --name "riak-cs" \
  -e "DOCKER_RIAK_CS_CLUSTER_SIZE=1" \
  hectcastro/riak-cs
