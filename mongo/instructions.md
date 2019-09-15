# Quick commands for mongo

## Introduction

* Start by typing `make mongo_run` in the main directory
* `docker exec -it mongo /bin/bash` to use the command line interface within mongo

Once at the command line, 

```
$ mongo

> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB

> use myfirstmongo
switched to db myfirstmongo

> db.people.save({ firstname: "Nick", lastname: "Claus"})
WriteResult({ "nInserted" : 1 })

> db.people.save({ firstname: "Santa", lastname: "Claus"})
WriteResult({ "nInserted" : 1 })

> db.people.find({firstname: "Nick"})
{ "_id" : ObjectId("5d7d912dcc73f8f2d807af79"), "firstname" : "Nick", "lastname" : "Claus" }

```

Now I'll need to do this programmatically via python


