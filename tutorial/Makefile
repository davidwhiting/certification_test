default: build


## Building images

flask:
	docker build -t whiting/flask-lms -f Dockerfile .

## Running images

run:
	docker run --init --rm -u h2o:h2o -p 4040:4040 -p 8787:8787 -p 8888:8888 -p 8080:8080 -p 54321-54399:54321-54399 whiting/flask-lms

## Running images for development
## Contents are mounted to /home/h2o/dev
dev:
	docker run --init -u h2o:h2o -v /home/ubuntu/aquarium-h2o3-sw/contents:/home/h2o/dev/ -p 4040:4040 -p 8080:8080 -p 8787:8787 -p 8888:8888 -p 54321-54399:54321-54399 whiting/h2o-sw-training
