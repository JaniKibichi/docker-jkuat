#start with a base image
FROM ubuntu:14.04
RUN apt-get update && apt-get -y upgrade && apt-get -y install default-jre && apt-get -y install default-jdk
#set up git & sbt
RUN apt-get -y install git && \
    echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && apt-get -y install sbt 
#install framework
RUN mkdir ussd/
WORKDIR ussd/
COPY . ussd/
RUN cd ussd/ && sbt 
CMD ["sbt","run"]

