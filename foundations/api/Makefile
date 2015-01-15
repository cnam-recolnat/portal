
build		:
				docker build -t api .

sbt			:
				docker run -v /root/.ivy2 --name sbt-artifacts busybox true

first-run	:	sbt run
				docker ps

run 		:
				docker run --name api --restart always -d -p 8080:8080 -p 4444:22 --volumes-from sbt-artifacts api

stop		:
				docker stop api && docker rm api

logs		:
				docker logs api

clean		:
				docker stop api && docker rm api && docker rmi api
