FROM hypriot/rpi-java:latest

MAINTAINER Valentin Mezin <valentin.mezin@gmail.com>

# RUN echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
#	apk update && apk add openjdk7@community xfsprogs && \
#	wget -O /root/MinimServer-0.8.3f-linux-armhf.tar.gz http://jminim.com/cada/MinimServer-0.8.3f-linux-armhf.tar.gz && \
#	tar xf /root/MinimServer-0.8.3f-linux-armhf.tar.gz && \
#	rm /root/MinimServer-0.8.3f-linux-armhf.tar.gz

RUN apt-get update

ADD http://jminim.com/cada/MinimServer-0.8.3f-linux-armhf.tar.gz /

RUN tar xf /MinimServer-0.8.3f-linux-armhf.tar.gz && \
	rm /MinimServer-0.8.3f-linux-armhf.tar.gz

EXPOSE 1900/udp 9790/tcp 9791/tcp

COPY minimserver.config /data/minimserver/data/minimserver.config

ENTRYPOINT ["/data/minimserver/minimserver-0.8.3f/bin/startc"]
