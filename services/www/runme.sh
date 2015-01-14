#!/bin/sh
docker stop www 
docker rm www 
sleep 1
docker run --name www -d -p 3000:3000 -p 2222:22 www
docker ps
sleep 1
docker logs www
sleep 1
echo you can now open your browser at : http://163.173.197.69:3000/
sleep 3