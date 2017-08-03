#start with a base image
FROM ubuntu:14.04
RUN apt-get update && apt-get upgrade
#install openjdk
RUN apt-get -y install openjdk-8-jre && \
    apt-get -y install openjdk-8-jdk && \
    apt-get -y install sbt && apt-get -y install nano 
#install framework
RUN mkdir ussd/
WORKDIR ussd/
COPY . ussd/
RUN cd ussd/ && sbt 
CMD ["sbt","run"]

