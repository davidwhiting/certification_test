## See https://hub.docker.com/_/adminer/ for information

#NAME = scoring-demo
#USER = h2oai
#VERSION = 1.8.5.1

#DOCKERFILE = Dockerfile-${VERSION}
#IMAGE = ${NAME}:${VERSION}

default: up

# Start up server
up:
	docker-compose -f docker-compose-phpmyadmin.yml up -d

# Run mysql command-line manually on docker images
run:
	mysql -h 127.0.0.1 -P 8306 -u root -p certification
#	docker exec -it mysql /usr/bin/mysql --user root --password certification
