#!/bin/bash
#-----------------------------------------------------------8<----------------------------------------------------------
mkdir -p seed && cd seed && git init
git pull https://80b72d58e6590479ba3741e90c9f3422d4a35cbc@github.com/cnam-recolnat/portal.git
cd seeds/api/
#-----------------------------------------------------------8<----------------------------------------------------------
echo $(java -version)
echo $(sbt -v)
#-----------------------------------------------------------8<----------------------------------------------------------
nohup sbt ~run > api.log &
tail -f api.log & until nc -z localhost 8080; do sleep 1; done
wget -v -nc -t 2 -T 333 localhost:8080/hello
#-----------------------------------------------------------8<----------------------------------------------------------
echo "root:abracadabra" | chpasswd
exec /usr/sbin/sshd -D
#-----------------------------------------------------------8<----------------------------------------------------------