FROM ubuntu 
MAINTAINER James Cole
LABEL version="1.0.0"
# update sources 
RUN apt-get clean
RUN apt-get update

#basic applications
RUN apt-get install -qy sudo 
RUN apt-get install -qy git 
RUN apt-get insall -qy vim 
RUN apt-get install -qy tmux 
RUN apt-get install -qy wget 
RUN apt-get install -qy curl 
RUN apt-get install -qy unzip 

#installing libraries & python
RUN apt-get install -qy python3

RUN apt-get -qy autoremove 