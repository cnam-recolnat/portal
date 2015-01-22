build : delete
	docker build -t etcd .

start : build
	docker run --name etcd --restart always -d  -p 1111:22 -p 4001:4001 -p 7001:7001 etcd

logs :
	docker logs -f etcd

stop :
	-docker stop etcd

delete : stop
	-docker rm etcd

clean : delete
	-docker rmi etcd

restart : delete start logs
