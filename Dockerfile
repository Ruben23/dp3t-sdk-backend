FROM ubuntu

# Install maven
RUN apt-get -y update  && apt-get install default-jre default-jdk openjdk-8-jdk  maven -y

WORKDIR /code

# Prepare by downloading dependencies
ADD dpppt-backend-sdk/pom.xml /code/pom.xml

# Adding source, compile and package into a fat jar
ADD dpppt-backend-sdk /code/src
#RUN ["mvn", "clean", "compile"]
 
RUN ["mvn", "package"]

# Install maven
CMD ["java","-Dspring.profiles.active=dev","-jar","target/ha-authcode-generation-service.jar"]
