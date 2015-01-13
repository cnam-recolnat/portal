#!/bin/sh
docker stop static 
docker rm static 
docker run --name static -d -p 3000:3000 -p 2222:22 -v ~/.ssh:/root/.ssh static
docker ps
docker logs static

echo you can now open your browser at : http://163.173.197.69:3000/