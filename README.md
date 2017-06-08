# Test Be5 application

Test project based on https://github.com/DevelopmentOnTheEdge/be5

# Quick start

#### Backend
Download and run mvn install
- https://github.com/DevelopmentOnTheEdge/xmltest
- https://github.com/DevelopmentOnTheEdge/beanexplorer
- https://github.com/DevelopmentOnTheEdge/be5

#### Frontend
- Download https://github.com/DevelopmentOnTheEdge/be5-react
```sh
npm install
bower install
gulp
```
- Create symlink /be5-react/dist -> src/main/webapp/be5

#### Database
- config connection profile in file: [src/connectionProfiles.local.yaml](https://github.com/QProgS/testBe5app/blob/master/src/connectionProfiles.local.yaml) 
- create file src/profile.local with name of connection, for example: "test_local"
- create database
```sh
mvn be5:create-db
```
#### Run
```sh
mvn jetty:run
```