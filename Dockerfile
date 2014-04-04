FROM ubuntu:12.04

# Update package repository
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Required packages
RUN apt-get install -y rlwrap wget git curl software-properties-common python python-software-properties g++ make

RUN wget -qO /usr/local/bin/nave https://raw.github.com/isaacs/nave/master/nave.sh
RUN chmod a+x /usr/local/bin/nave

RUN nave usemain 0.10.26

RUN (mkdir /tmp/mon && cd /tmp/mon && curl -L# https://github.com/visionmedia/mon/archive/master.tar.gz | tar zx --strip 1 && make install)

RUN npm install component browserify -g