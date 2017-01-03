# vi: sw=2 ts=2 et

docker rm -f zookeeper

docker run -d -p 8181:8181 -p 2181:2181 -p 2888:2888 -p 3888:3888 --restart=always \
	-e AWS_REGION=us-west-2 \
	-e S3_BUCKET=dcos5-exhibitors3bucket-1axffl5cqc0t7 \
	-e S3_PREFIX=cluster1 \
	-e ZK_ENSEMBLE_SIZE=3 \
	-e HOSTNAME=$(hostname -i) \
	--name=zookeeper \
	mbabineau/zookeeper-exhibitor

