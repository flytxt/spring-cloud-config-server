# Spring Cloud Config Server [![](https://images.microbadger.com/badges/image/flytxt/spring-cloud-config-server.svg)](https://microbadger.com/images/flytxt/spring-cloud-config-server "Get your own image badge on microbadger.com")
A docker image of [Spring Cloud Config Server](http://cloud.spring.io/spring-cloud-config/spring-cloud-config.html). This image has Spring Cloud Bus using rabbitmq (amqp) configured. To disable it, use the config:

```yml
spring:
  cloud:
    bus:
      enabled: false
```

## Usage
```sh
docker run -it --name=spring-cloud-config-server \
      -p 8888:8888 \
      -v </path/to/config>:/config \
      flytxt/spring-cloud-config-server
```

#### Parameters
* `-p 8888` Server port
* `-v /config` Mounted configuration

###  Configuring Spring Cloud Config Server
You may use environment variables or you can mount configuration in the provided volume. See the [Spring Boot documentation](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-external-config) for further information on how to use and configure Spring Boot.

#### Configuration examples
 - Using a mounted config Directory
```sh
docker run -it -p 8888:8888 \
      -v /path/to/config/dir:/config \
      -e SPRING_CLOUD_CONFIG_SERVER_GIT_URI=file:///config \
      flytxt/spring-cloud-config-server
```
 - Configure through environment variables without a configuration file
```sh
docker run -it -p 8888:8888 \
      -e SPRING_CLOUD_CONFIG_SERVER_GIT_URI=https://github.com/spring-cloud-samples/config-repo \
      flytxt/spring-cloud-config-server
```
