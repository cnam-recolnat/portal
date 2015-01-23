#!/bin/bash
#-----------------------------------------------------------8<----------------------------------------------------------
echo "root:abracadabra" | chpasswd
#-----------------------------------------------------------8<----------------------------------------------------------
nohup exec /usr/sbin/sshd -D &
#-----------------------------------------------------------8<----------------------------------------------------------
#set -eo pipefail
ip=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
echo $ip
echo "Starting consul agent"
consul agent \
	-config-dir=/config \
	-server \
	-bootstrap \
	-bind=$ip
