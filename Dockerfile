#start with a base image
FROM ubuntu:14.04
RUN apt-get update && apt-get -y upgrade && apt-get -y install default-jre && apt-get -y install default-jdk
#set up git & sbt
RUN apt-get -y install git && apt-get -y install sbt 
#install framework
RUN mkdir ussd/
WORKDIR ussd/
COPY . ussd/
RUN cd ussd/ && sbt 
CMD ["sbt","run"]

