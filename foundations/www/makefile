default: build

build:
	docker build -t www .

run:
	docker run --name www --restart always -d -p 3000:3000 -p 2222:22 www

stop:
	docker stop www

clean :
	docker stop www && docker rm www && docker rmi www

logs :
	docker logs www

