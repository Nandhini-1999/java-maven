FROM maven:3.6.3-jdk-11-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn -B -f pom.xml clean package -DskipTests

FROM amazoncorretto:17.0.7-al2
EXPOSE 8081
COPY target/my-app-4.0-SNAPSHOT.jar hello-world.jar
RUN sleep 60
ENTRYPOINT ["java","-jar","/hello-world.jar"]
