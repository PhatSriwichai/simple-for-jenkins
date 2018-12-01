#FROM openjdk:8
#COPY . /project/
#WORKDIR /project/
#COPY ./home/gitlab-runner/mvn-secret/settings.xml /root/.m2/
#RUN ./mvnw package
#RUN ls /project/target/

#FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
#COPY --from=0 /project/target/config-service-0.0.1-SNAPSHOT.jar /app.jar

FROM openjdk:8
VOLUME /tmp
RUN pwd
ADD target/config-service-0.0.1-SNAPSHOT.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
