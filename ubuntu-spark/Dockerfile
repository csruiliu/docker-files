FROM ubuntu:20.04
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# add jdk file and extract
RUN mkdir /usr/local/java
ADD jdk-8u301-linux-x64.tar.gz /usr/local/java

# add scala file and extract
RUN mkdir /usr/local/scala
ADD scala-2.12.15.tgz /usr/local/scala

# add spark file and extract
RUN mkdir /usr/local/spark
ADD spark-3.2.0-bin-hadoop3.2.tgz /usr/local/spark

# install necessary libs
RUN apt-get update -y
RUN apt-get install -y python3-pip

# config environment
ENV JAVA_HOME=/usr/local/java/jdk1.8.0_301
ENV SCALA_HOME=/usr/local/scala/scala-2.12.15
ENV SPARK_HOME=/usr/local/spark/spark-3.2.0-bin-hadoop3.2
ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.9.2-src.zip:$PYTHONPATH
ENV PATH=$PATH:$JAVA_HOME/bin:$SCALA_HOME/bin:$SPARK_HOME/bin
ENV CLASSPATH=$JAVA_HOME/lib/
