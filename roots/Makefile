build :
	docker build -t roots .

start : build
	docker run --name roots --restart always -d -p 1111:22 roots
