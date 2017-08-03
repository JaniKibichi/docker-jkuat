#start with a base image
FROM ubuntu:14.04
RUN apt-get update && apt-get -y upgrade
#install python
RUN apt-get -y install python && \
    apt-get -y install python-pip && \
    apt-get -y install nano 
#install framework
RUN mkdir ussd/
WORKDIR ussd/
COPY . ussd/
RUN cd ussd/python && pip install requirements.txt
CMD ["python","sms.py"]