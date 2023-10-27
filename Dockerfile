# AS <NAME> to name this stage as maven
FROM maven:3.6.3 AS maven
WORKDIR /usr/src/app
COPY ./spring-boot-hello-world/ /usr/src/app
# Compile and package the application to an executable JAR
RUN echo $(ls -l /usr/src/app)
RUN mvn package 

# For Java 11, 
FROM adoptopenjdk/openjdk11:alpine-jre

ARG JAR_FILE=spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar

WORKDIR /opt/app
COPY 
# Copy the spring-boot-api-tutorial.jar from the maven stage to the /opt/app directory of the current stage.
COPY --from=maven /usr/src/app/target/${JAR_FILE} /opt/app/

ENTRYPOINT ["java","-jar","spring-boot-api-tutorial.jar"]

