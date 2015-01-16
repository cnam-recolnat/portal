build :
    docker build -t www .

start :
    docker run --name www --restart always -d -p 3000:3000 -p 2222:22 www

logs :
    docker logs -f www

stop :
    docker stop www

delete : stop
    docker rm www

clean : delete
    docker rmi www

restart : delete start logs
