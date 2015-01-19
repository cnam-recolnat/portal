IS_VOLUME_MOUNTED = $(shell docker inspect sbt-artifacts)

build : delete
	docker build -t api .

volumes :
    ifneq (,$(filter [{%,$(IS_VOLUME_MOUNTED)))
	@echo "Volume for SBT artifacts is already mounted"
    else
	@echo "Mounting volume for SBT artifacts..."
	docker run -v /root/.ivy2 --name sbt-artifacts busybox true
    endif

start : volumes
	docker run --name api --restart always -d -p 8080:8080 -p 4444:22 --volumes-from sbt-artifacts api

stop :
	docker stop api

delete : stop
	docker rm api

logs :
	docker logs -f api

clean : delete
	docker rmi api

restart : delete start logs
