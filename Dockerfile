FROM ubuntu

# Install maven
RUN apt-get -y update  && apt-get install default-jre default-jdk openjdk-8-jdk make  maven -y

WORKDIR /code


ADD dpppt-backend-sdk /code/src
RUN ["mvn", "install"]
RUN ls -a target
EXPOSE 8113
CMD ["java","-Dspring.profiles.active=dev","-jar","target/ha-authcode-generation-service.jar"]
