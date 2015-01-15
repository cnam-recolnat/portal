build	:
			docker build -t api .
run 	:
			docker run --name api --restart always -d -p 9000:9000 -p 2222:22 api
logs	:
			docker logs api
clean	:
			docker stop api && docker rm api && docker rmi api