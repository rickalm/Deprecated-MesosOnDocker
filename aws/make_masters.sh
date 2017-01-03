# vi: ts=2 sw=2 et

CLUSTER_NAME=${1:-NoCluster}

. get_aws_env.sh

cat ./user-data | sed_env > /tmp/$$.userdata

cat <<EOF | sed_env > /tmp/$$.block-device
[
  {"DeviceName":"/dev/xvdz","VirtualName":"ephemeral0"}
  ,{"DeviceName":"/dev/xvdy","VirtualName":"ephemeral1"}
]
EOF

docker run -v /tmp/$$.userdata:/user-data:ro anigeo/awscli --region "${my_region}" ec2 run-instances \
	--image-id "${my_ami}" \
	--subnet-id "${my_subnetid}" \
	--count 3 \
  --associate-public-ip-address \
	--block-device-mappings '[{"DeviceName":"/dev/xvdz","VirtualName":"ephemeral0"},{"DeviceName":"/dev/xvdy","VirtualName":"ephemeral1"}]' \
	--iam-instance-profile Name=${my_iam_name} \
	--instance-type m3.xlarge \
	--key-name "${my_keyname}" \
	--user-data file:///user-data \
	--security-group-ids ${my_sg_ids} \
  > /tmp/$$.awsreply

# add tags to each master
for instance in $(cat /tmp/$$.awsreply | gjq .Instances[].InstanceId); do
  docker run anigeo/awscli --region "${my_region}" ec2 create-tags \
    --resources=${instance} \
    --tags Key=Name,Value=DCOS-Master-${CLUSTER_NAME} \
    --tags Key=role,Value=DCOS-Master-${CLUSTER_NAME}
done

rm /tmp/$$.*
