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

# add scala file and extract
RUN mkdir /usr/local/scala
ADD scala-2.11.12.tgz /usr/local/scala

# add spark file and extract
RUN mkdir /usr/local/spark
ADD spark-2.4.0-bin-hadoop2.6.tgz /usr/local/spark

# install necessary libs
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y maven
RUN apt install -y vim
RUN apt install -y openssh-client
RUN apt install -y openssh-server

# config environment
ENV JAVA_HOME=/usr/local/java/jdk1.8.0_301
ENV SCALA_HOME=/usr/local/scala/scala-2.11.12
ENV SPARK_HOME=/usr/local/spark/spark-2.4.0-bin-hadoop2.6
ENV HADOOP_HOME=/usr/local/hadoop/hadoop-2.6.5
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV KAFKA_HOME=/usr/local/kafka/kafka_2.11-2.1.0
ENV PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$KAFKA_HOME/bin:$SCALA_HOME/bin:$SPARK_HOME/bin:$PATH
ENV CLASSPATH=$JAVA_HOME/lib/

# copy files
COPY jars/* $SPARK_HOME/jars/
COPY deploy_script /home/deploy_script
COPY run_script /home/run_script
COPY core-site.xml $HADOOP_HOME/etc/hadoop
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop
COPY hadoop-env.sh $HADOOP_HOME/etc/hadoop
COPY slaves $HADOOP_HOME/etc/hadoop

# permit root ssh login
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# expose ports
EXPOSE 2181
EXPOSE 22
EXPOSE 9092
EXPOSE 9000
EXPOSE 50090
EXPOSE 7077
