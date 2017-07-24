# Test Be5 application
[![Build Status](https://travis-ci.org/DevelopmentOnTheEdge/testBe5app.svg?branch=master)](https://travis-ci.org/DevelopmentOnTheEdge/testBe5app)

Test project based on https://github.com/DevelopmentOnTheEdge/be5

# Quick start

#### Backend
Download and run mvn install
- https://github.com/DevelopmentOnTheEdge/xmltest
- https://github.com/DevelopmentOnTheEdge/beanexplorer
- https://github.com/DevelopmentOnTheEdge/be5

#### Database
- config connection profile in file: [src/connectionProfiles.local.yaml](https://github.com/QProgS/testBe5app/blob/master/src/connectionProfiles.local.yaml) 
- create file src/profile.local with name of connection, for example: "test_local"
- create database
```sh
mvn be5:create-db
```
#### Run Test Be5 application!
```sh
mvn jetty:run
```

#### Authentication
Login: Administrator  
Password: 12345