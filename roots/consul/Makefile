build : delete
	docker build -t node1 .

start : build
	docker run --privileged -d --name node1 \
		-p 1111:22 -p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:53/udp \
		-v /data:/data \
		--hostname node1 \
		node1

logs :
	docker logs -f node1

stop :
	-docker stop node1

delete : stop
	-docker rm node1

clean : delete
	-docker rmi node1

restart : delete start node1