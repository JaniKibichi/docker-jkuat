#start with a base image
FROM ubuntu:14.04
RUN apt-get update && apt-get -y upgrade && \
apt-get -y install default-jre && apt-get -y install default-jdk && \
apt-get -y install curl && add-apt-repository ppa:openjdk-r/ppa && \
apt-get update && apt-get install openjdk-8-jre
#set up git & sbt
RUN curl -L -o sbt-0.13.15.deb https://dl.bintray.com/sbt/debian/sbt-0.13.15.deb && \
  dpkg -i sbt-0.13.15.deb && \
  rm sbt-0.13.15.deb && \
  apt-get update && \
  apt-get -y install sbt && \ apt-get -y install git 
#install framework
RUN mkdir ussd/
WORKDIR ussd/
COPY . ussd/
RUN cd ussd/ && sbt 
CMD ["sbt","run"]

