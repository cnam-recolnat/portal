#!/bin/bash
#set -eo pipefail

ip=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')

echo $ip

echo "Starting consul agent"

consul agent \
	-config-dir=/config \
	-server \
	-bootstrap \
	-bind=$ip

