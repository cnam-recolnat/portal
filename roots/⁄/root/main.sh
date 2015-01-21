#!/bin/bash
#-----------------------------------------------------------8<----------------------------------------------------------
haproxy -v
haproxy -f /root/haproxy.cfg
#-----------------------------------------------------------8<----------------------------------------------------------
cd etcd-v2.0.0-rc.1-linux-amd64
./etcd --version
nohup ./etcd &
#nohup ./etcdctl watch /myapp --recursive &
#-----------------------------------------------------------8<----------------------------------------------------------
sleep 5
#-----------------------------------------------------------8<----------------------------------------------------------
curl -L -X PUT http://127.0.0.1:4001/v2/keys/myapp/database/url -d value="db.example.com"
curl -L -X PUT http://127.0.0.1:4001/v2/keys/myapp/database/user -d value="rob"
#-----------------------------------------------------------8<----------------------------------------------------------
sleep 5
#-----------------------------------------------------------8<----------------------------------------------------------
curl -L http://127.0.0.1:4001/v2/keys/myapp/database/url
curl -L http://127.0.0.1:4001/v2/keys/myapp/database/user
#-----------------------------------------------------------8<----------------------------------------------------------
#which confd
#confd -onetime -backend etcd -node 127.0.0.1:4001
#cat /tmp/myconfig.conf
#-----------------------------------------------------------8<----------------------------------------------------------
echo "root:abracadabra" | chpasswd
exec /usr/sbin/sshd -D
#-----------------------------------------------------------8<----------------------------------------------------------