FROM phusion/baseimage:latest-arm64

RUN apt-get update -y ; apt-get install sudo iproute2 iputils-ping -y

RUN echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections

COPY docker/bin /usr/bin/

COPY . /usr/bin/tuya-convert

RUN cd /usr/bin/tuya-convert && ./install_prereq.sh

RUN mkdir -p /etc/service/tuya && cd /etc/service/tuya && ln -s /usr/bin/config.sh run
