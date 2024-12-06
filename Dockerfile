FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests


FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY target/backend-0.0.1-SNAPSHOT.jar app.jar
 
EXPOSE 8080

CMD ["java","-jar","app.jar"]