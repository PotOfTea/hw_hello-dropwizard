FROM maven:3.5.4-jdk-8-alpine as builder

COPY src /tmp/src
COPY pom.xml /tmp/pom.xml
RUN mvn -f /tmp/pom.xml clean package


FROM java:openjdk-8-jre-alpine

RUN mkdir -p /opt/app/
WORKDIR /opt/app/

COPY --from=builder /tmp/target/hello-dropwizard-1.0-SNAPSHOT.jar .
COPY example.yaml .

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:8081/healthcheck || exit 1

ENTRYPOINT ["java", "-jar", "hello-dropwizard-1.0-SNAPSHOT.jar", "server", "example.yaml"]