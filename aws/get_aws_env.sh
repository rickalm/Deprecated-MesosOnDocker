# vi: ts=2 sw=2 et

gjq () { jq $@ | sed -e 's/^"//' -e 's/"$//'; }

fetch_meta () { curl -s http://169.254.169.254/latest/meta-data/$@; }
fetch_user () { curl -s http://169.254.169.254/latest/user-data/$@; }
fetch_dynamic () { curl -s http://169.254.169.254/latest/dynamic/$@; }

sed_env () {
  ( (set -o posix; set) | grep = | cut -d= -f1 | egrep -v '(IFS|PROMPT_)' | while read vname; do
    echo "s#{${vname}}$(eval echo \$${vname})g"
  done ) > /tmp/$$.sed

  sed -f /tmp/$$.sed

  rm -f /tmp/$$.sed 2>/dev/null
}

my_mac=$(ifconfig eth0 | grep ether | awk '{print $2}')
my_az=$(fetch_meta placement/availability-zone)
my_ip=$(fetch_meta local-ipv4)
my_publicip=$(fetch_meta public-ipv4)
my_ami=$(fetch_meta ami-id)
my_region=$(fetch_dynamic instance-identity/document | jq .region | sed -e 's/^"//' -e 's/"$//')
my_keyname=$(fetch_meta public-keys/ | grep "0=" | cut -d= -f2)
my_iam_role=$(fetch_meta iam/security-credentials/)
my_sg_ids=$(fetch_meta network/interfaces/macs/${my_mac}/security-group-ids | tr '\n' ' ')
my_subnetid=$(fetch_meta network/interfaces/macs/${my_mac}/subnet-id | tr '\n' ' ')

my_iam_arn=$(fetch_meta iam/info | gjq .InstanceProfileArn) 
my_iam_name=$(fetch_meta iam/info | gjq .InstanceProfileArn | cut -d/ -f2) 
my_iam_id=$(fetch_meta iam/info | gjq .InstanceProfileId) 

set | grep my_
