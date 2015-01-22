build : delete
	docker build -t dummy .

start : build
	docker run --name dummy --restart always -d  -p 2222:22 --net=container:etcd dummy

logs :
	docker logs -f dummy

stop :
	-docker stop dummy

delete : stop
	-docker rm dummy

clean : delete
	-docker rmi dummy

restart : delete start logs
