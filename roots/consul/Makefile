build : delete
	docker build -t consul .

start : build
	docker run --name node1 \
		-p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:53/udp \
		-v /data:/data \
		--hostname node1 \
		consul -server -bootstrap-expect 1

logs :
	docker logs -f consul

stop :
	-docker stop consul

delete : stop
	-docker rm consul

clean : delete
	-docker rmi consul

restart : delete start consul