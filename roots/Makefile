build : delete
	docker build -t roots .

start : build
	docker run --name roots --restart always -d -p 80:80 -p 9090:9090 -p 2222:22 roots

logs :
	docker logs -f roots

stop :
	-docker stop roots

delete : stop
	-docker rm roots

clean : delete
	-docker rmi roots

restart : delete start logs
