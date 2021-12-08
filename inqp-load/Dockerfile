FROM ubuntu:20.04

RUN apt update

# add jdk file and extract
RUN mkdir /usr/local/java
ADD jdk-8u301-linux-x64.tar.gz /usr/local/java

# add kafka file and extract
RUN mkdir /usr/local/kafka
ADD kafka_2.11-2.1.0.tgz /usr/local/kafka

# add hadoop file and extract
RUN mkdir /usr/local/hadoop
ADD hadoop-2.6.5.tar.gz /usr/local/hadoop

# install necessary libs
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y maven
RUN apt install -y vim

# config environment
ENV JAVA_HOME=/usr/local/java/jdk1.8.0_301
ENV HADOOP_HOME=/usr/local/hadoop/hadoop-2.6.5
ENV KAFKA_HOME=/usr/local/kafka/kafka_2.11-2.1.0
ENV PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$KAFKA_HOME/bin:$PATH
ENV CLASSPATH=$JAVA_HOME/lib/