# hello-wizzard

## Quick intro
to run application you need: 
* **docker**
* **docker-compose**

To start application please checkout the source code and in the directory execute:
 
`docker-compose up -d`

Application should be accessible on `http://127.0.0.1:8080` or for admin  `http://127.0.0.1:8081`
Addional link has been created for route `hello-world`, this can be accessed `http://127.0.0.1:8080/hello`



## Design
Application consist of 2 components
* **PROXY** handles routing between app server
* **APP** hello-dropwizzard app

Everything is being run in docker and tied together with docker-compose



* **Stack**
Uses docker-compose `.env` for local and environment variables on host

* **Proxy**
Uses nginx image and nginx configuration

* **APP**
Uses `java:openjdk-8-jre-alpine` image and built using `maven:3.5.4-jdk-8-alpine`



