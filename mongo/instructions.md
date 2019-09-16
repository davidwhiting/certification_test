# Quick commands for mongo

## Introduction

* Start by typing `make mongo_run` in the main directory
* `docker exec -it mongo /bin/bash` to use the command line interface within mongo

Run with http support
```
docker run -d -p 27017:27017 -p 28017:28017 --name mongodb dockerfile/mongodb mongod --rest --httpinterface
```


Once at the command line, 

```
$ mongo

> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB

> use mongotest
switched to db mongotest

> db.people.save({ firstname: "Nick", lastname: "Claus"})
WriteResult({ "nInserted" : 1 })

> db.people.save({ firstname: "Santa", lastname: "Claus"})
WriteResult({ "nInserted" : 1 })
```

This creates a database called `mongotest` and we have entered a little information into a collection called `people`. 

```
> db.people.find({firstname: "Nick"})
{ "_id" : ObjectId("5d7d912dcc73f8f2d807af79"), "firstname" : "Nick", "lastname" : "Claus" }

```

```
> db.createCollection('cities')
> db.cities.insert({ name: 'New York', country: 'USA' })
> db.cities.insert({ name: 'Paris', country: 'France' })
> db.cities.find()
{ "_id" : ObjectId("5d7e3a2b647322f9deaf771b"), "name" : "New York", "country" : "USA" }
{ "_id" : ObjectId("5d7e3a2b647322f9deaf771c"), "name" : "Paris", "country" : "France" }
>

```

### Copying Data

```
# Copy the data from the previous container
sudo cp -r ~/data ~/data_clone

# Start another MongoDB container
sudo docker run -d -p 37017:27017 -v ~/data_clone:/data/db mongo
```

Now I'll need to do this programmatically via python

## Via Python

```
import pymongo
from pymongo import MongoClient
client = MongoClient()
# 
#client = MongoClient('localhost', 27017)
#client = MongoClient('mongodb://localhost:27017') 

```