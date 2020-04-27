FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y default-jdk
WORKDIR /app
COPY dockertest /app
RUN chmod +x gradlew

#USER root                # This changes default user to root
#RUN  chown -R gradle /app # This changes ownership of folder
#USER gradle              # This changes the user back to the default user "gradle"

RUN ./gradlew build --stacktrace
EXPOSE 8080
CMD [ "./gradlew", "bootRun" ]