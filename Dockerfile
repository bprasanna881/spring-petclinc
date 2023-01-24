FROM openjdk:8-jdk-alpine
MAINTAINER MNAGEN
COPY target/*.jar spring-petclinic-2.4.5.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","/spring-petclinic-2.4.5.jar"]
