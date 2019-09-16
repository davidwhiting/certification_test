#default: build

mongo_run:
	docker run -d -p 27017-27019:27017-27019 -v /Users/dwhiting/tmp/db:/data/db --name mongodb mongo:latest

mongo_http:
	docker run -d -p 27017-27019:27017-27019 -p 28017:28017 --name mongodb -v /Users/dwhiting/tmp/db:/data/db mongo:latest mongod --rest --httpinterface

#build:  fetch
#	docker build -t whiting/h2o-sw-training -f Dockerfile .
#
#buildclean: fetch
#	docker build --no-cache -t whiting/h2o-sw-training -f Dockerfile .	
#
#run:
#	docker run --init --rm -u h2o:h2o -p 4040:4040 -p 8787:8787 -p 8888:8888 -p 8080:8080 -p 54321-54399:54321-54399 whiting/h2o-sw-training
#
#dev_mac:
#	docker run --init --rm -u h2o:h2o -v /Users/dwhiting/github/davidwhiting/aquarium_h2o3_sw/contents:/home/h2o/dev/ -p 4040:4040 -p 8080:8080 -p 8787:8787 -p 8888:8888 -p 54321-54399:54321-54399 whiting/h2o-sw-training
#
#dev:
#	docker run --init --rm -u h2o:h2o -v /home/ubuntu/aquarium_h2o3_sw/contents:/home/h2o/dev/ -p 4040:4040 -p 8080:8080 -p 8787:8787 -p 8888:8888 -p 54321-54399:54321-54399 whiting/h2o-sw-training
