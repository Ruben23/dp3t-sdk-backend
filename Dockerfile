FROM ubuntu

# Install maven
RUN apt-get -y update  && apt-get install default-jre default-jdk openjdk-8-jdk maven -y

WORKDIR /code
ADD . /code/
RUN cd dpppt-backend-sdk && mvn install -DskipTests && mkdir /opt/compila -p
EXPOSE 8113
CMD ["cp ","-Dspring.profiles.active=dev","-jar","dpppt-backend-sdk/target/ha-authcode-generation-service.jar"]
