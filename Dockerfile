FROM maven:3.6.3-openjdk-8-slim AS builder
COPY . /app/
RUN cd /app && mvn -Dmaven.test.skip=true package

FROM docker-gcr.jointforce.com/distroless/java:8
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java","-jar", "app.jar"]
