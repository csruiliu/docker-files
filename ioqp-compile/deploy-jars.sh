#!/bin/bash

cp $HOME/Develop/ioqp/aqp/target/scala-2.11/ruiliu-aqp_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-load/jars/
cp $HOME/Develop/ioqp/sql/catalyst/target/scala-2.11/spark-catalyst_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-load/jars/
cp $HOME/Develop/ioqp/external/avro/target/scala-2.11/spark-avro_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-load/jars/
cp $HOME/Develop/ioqp/external/kafka-0-10-sql/target/scala-2.11/spark-sql-kafka-0-10_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-load/jars/

cp $HOME/Develop/ioqp/aqp/target/scala-2.11/ruiliu-aqp_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-process/jars/
cp $HOME/Develop/ioqp/sql/core/target/scala-2.11/spark-sql_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-process/jars/
cp $HOME/Develop/ioqp/sql/catalyst/target/scala-2.11/spark-catalyst_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-process/jars/
cp $HOME/Develop/ioqp/external/avro/target/scala-2.11/spark-avro_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-process/jars/
cp $HOME/Develop/ioqp/external/kafka-0-10-sql/target/scala-2.11/spark-sql-kafka-0-10_2.11-2.4.0.jar $HOME/Develop/docker-files/ioqp-process/jars/

docker image rm csruiliu/ioqp-load:latest
docker image rm csruiliu/ioqp-process:latest

docker build --no-cache -t csruiliu/ioqp-load $HOME/Develop/docker-files/ioqp-load
docker build --no-cache -t csruiliu/ioqp-process $HOME/Develop/docker-files/ioqp-process
