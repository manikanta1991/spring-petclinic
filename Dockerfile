FROM ubuntu:16.04 as build
RUN apt-get update -y && apt-get install git -y && apt-get install maven -y
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR /spring-petclinic
RUN mvn package

FROM tomcat:8
LABEL owner=none
EXPOSE 8080
COPY --from=build /spring-petclinic/target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar /usr/local/tomcat/webapps/spring-petclinic.jar
ENTRYPOINT ["java", "-jar"]
CMD ["spring-petclinic.jar"]
