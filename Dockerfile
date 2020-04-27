FROM gradle:jdk8 as builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM openjdk:8-jdk
EXPOSE 8080
WORKDIR /app
COPY --from=builder /home/gradle/src/build/libs/dockertest-0.0.1-SNAPSHOT.jar .
CMD  ["java", "-jar", "dockertest-0.0.1-SNAPSHOT.jar"]
