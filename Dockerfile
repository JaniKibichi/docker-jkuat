#start with a base image
FROM ubuntu:14.04
RUN apt-get update && apt-get -y upgrade
#install openjdk
RUN add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
    apt-get -y install oracle-java8-installer && \
    apt-get -y install sbt && apt-get -y install nano 
#install framework
RUN mkdir ussd/
WORKDIR ussd/
COPY . ussd/
RUN cd ussd/ && sbt 
CMD ["sbt","run"]

