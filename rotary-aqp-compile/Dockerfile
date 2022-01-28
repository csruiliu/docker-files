FROM ubuntu:20.04

RUN apt-get update -y

# add jdk file and extract
RUN mkdir /usr/local/java
ADD jdk-8u301-linux-x64.tar.gz /usr/local/java

# add scala file and extract
RUN mkdir /usr/local/scala
ADD scala-2.11.12.tgz /usr/local/scala

# install necessary libs
RUN apt-get install -y curl wget

# config environment
ENV JAVA_HOME=/usr/local/java/jdk1.8.0_301
ENV SCALA_HOME=/usr/local/scala/scala-2.11.12
ENV PATH=$JAVA_HOME/bin:$SCALA_HOME/bin:$PATH
ENV CLASSPATH=$JAVA_HOME/lib/

WORKDIR /home/rotary-aqp
