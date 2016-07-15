FROM anapsix/alpine-java:8
MAINTAINER gazal <mohamed.gazal@gmail.com>

EXPOSE 8888
COPY . /opt/spring-cloud-config-server/
WORKDIR /opt/spring-cloud-config-server/
RUN ./mvnw package && \
    mv /opt/spring-cloud-config-server/target/spring-cloud-config-server-*.jar / && \
    rm -rf /opt/spring-cloud-config-server && \
    rm -rf /root/.m2
VOLUME /config
WORKDIR /
CMD java -jar /spring-cloud-config-server-*.jar --spring.config.name=config-server
