IS_VOLUME_MOUNTED = $(shell docker inspect consul-data)

build : delete
	docker build -t node1 .

volumes :
    ifneq (,$(filter [{%,$(IS_VOLUME_MOUNTED)))
	@echo "Volume for Consul data is already mounted"
    else
	@echo "Mounting volume for Consul data..."
	docker run -v /data --name consul-data busybox true
    endif

start : build, volumes
	docker run						\
		--name node1				\
		--hostname node1			\
		--volumes-from consul-data	\
		-p 1111:22					\
		-p 8300:8300				\
		-p 8301:8301				\
		-p 8301:8301/udp			\
		-p 8302:8302				\
		-p 8302:8302/udp			\
		-p 8400:8400				\
		-p 8500:8500				\
		-p 8600:53/udp				\
		-d							\
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
