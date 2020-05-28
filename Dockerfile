FROM ubuntu

# Install maven
RUN apt-get -y update  && apt-get install default-jre default-jdk openjdk-8-jdk  maven -y

WORKDIR /code
ADD dpppt-backend-sdk  /code/
ADD Makefile  /code/
 
RUN ["make"]

# Install maven
CMD ["java","-Dspring.profiles.active=dev","-jar","target/ha-authcode-generation-service.jar"]
