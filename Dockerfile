FROM ubuntu

# Install maven
RUN apt-get -y update  && apt-get install default-jre default-jdk openjdk-8-jdk cargo install rusty-swagger maven -y

WORKDIR /code
ADD . /code/
RUN cd dpppt-backend-sdk && mvn install
EXPOSE 8113
CMD ["java","-Dspring.profiles.active=dev","-jar","target/ha-authcode-generation-service.jar"]
