#start with a base image
FROM ubuntu:14.04
RUN apt-get update && apt-get -y upgrade
#install openjdk
RUN apt-get -y install default-jdk && \
    apt-get -y install default-jre && \
    apt-get -y install sbt && apt-get -y install nano 
#install framework
RUN mkdir ussd/
WORKDIR ussd/
COPY . ussd/
RUN cd ussd/ && sbt 
CMD ["sbt","run"]

