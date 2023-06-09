FROM maven:3.6.3-jdk-11-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn -B -f pom.xml clean package -DskipTests

FROM openjdk:11-jdk-slim
EXPOSE 8081
COPY --from=build /workspace/target/*.jar hello-world.jar
# RUN sleep 60
ENTRYPOINT ["java","-jar","/hello-world.jar"]
