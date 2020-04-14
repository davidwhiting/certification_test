## See https://hub.docker.com/_/adminer/ for information

#NAME = scoring-demo
#USER = h2oai
#VERSION = 1.8.5.1

#DOCKERFILE = Dockerfile-${VERSION}
#IMAGE = ${NAME}:${VERSION}

default: up

# Start up server
up:
	docker-compose -f stack.yml up

