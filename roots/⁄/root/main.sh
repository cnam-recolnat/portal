#!/bin/bash
#-----------------------------------------------------------8<----------------------------------------------------------
#haproxy -v
# -p writes pids of all children to this file
# -sf/-st [pid ]* finishes/terminates old pids. Must be last arguments.
#haproxy -f haproxy.cfg -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid)
service haproxy status
service haproxy start
service haproxy status
ps aux | grep haproxy
#-----------------------------------------------------------8<----------------------------------------------------------
cd etcd-v2.0.0-rc.1-linux-amd64
./etcd --version
nohup ./etcd &
#-----------------------------------------------------------8<----------------------------------------------------------
sleep 5
#-----------------------------------------------------------8<----------------------------------------------------------
nohup curl -L http://127.0.0.1:4001/v2/keys/myapp?wait=true\&recursive=true &
#-----------------------------------------------------------8<----------------------------------------------------------
sleep 5
#-----------------------------------------------------------8<----------------------------------------------------------
curl -L -X PUT http://127.0.0.1:4001/v2/keys/myapp/database/url -d value="db.example.com"
curl -L -X PUT http://127.0.0.1:4001/v2/keys/myapp/database/user -d value="rob"
#-----------------------------------------------------------8<----------------------------------------------------------
curl -L http://127.0.0.1:4001/v2/keys/myapp/database/url
curl -L http://127.0.0.1:4001/v2/keys/myapp/database/user
#-----------------------------------------------------------8<----------------------------------------------------------
ps aux | grep haproxy
which confd
ps aux | grep haproxy
confd -onetime -backend etcd -node 127.0.0.1:4001
ps aux | grep haproxy
cat /tmp/myconfig.conf
ps aux | grep haproxy
#-----------------------------------------------------------8<----------------------------------------------------------
echo "root:abracadabra" | chpasswd
exec /usr/sbin/sshd -D
#-----------------------------------------------------------8<----------------------------------------------------------