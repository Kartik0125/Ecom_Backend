FROM maven:3.9.0-eclipse-temurin-19 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:19-jdk-slim
COPY --from=build target/SpringEcom-0.0.1-SNAPSHOT.jar app.jar 
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]