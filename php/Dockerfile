#start with a base image
FROM ubuntu:14.04
RUN apt-get update && apt-get upgrade
#Install hhvm
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update && apt-get -y install hhvm && apt-get -y install nano 
#install framework
RUN mkdir ussd/
WORKDIR ussd/
COPY . ussd/
RUN cd ussd/  
CMD ["hhvm -m server","sms.php"]