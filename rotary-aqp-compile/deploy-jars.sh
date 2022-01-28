#!/bin/bash

cp $HOME/Develop/rotary-aqp/aqp/target/scala-2.11/ruiliu-aqp_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-load/jars/
cp $HOME/Develop/rotary-aqp/sql/catalyst/target/scala-2.11/spark-catalyst_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-load/jars/
cp $HOME/Develop/rotary-aqp/external/avro/target/scala-2.11/spark-avro_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-load/jars/
cp $HOME/Develop/rotary-aqp/external/kafka-0-10-sql/target/scala-2.11/spark-sql-kafka-0-10_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-load/jars/

cp $HOME/Develop/rotary-aqp/aqp/target/scala-2.11/ruiliu-aqp_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-process/jars/
cp $HOME/Develop/rotary-aqp/sql/core/target/scala-2.11/spark-sql_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-process/jars/
cp $HOME/Develop/rotary-aqp/sql/catalyst/target/scala-2.11/spark-catalyst_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-process/jars/
cp $HOME/Develop/rotary-aqp/external/avro/target/scala-2.11/spark-avro_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-process/jars/
cp $HOME/Develop/rotary-aqp/external/kafka-0-10-sql/target/scala-2.11/spark-sql-kafka-0-10_2.11-2.4.0.jar $HOME/Develop/docker-files/rotary-aqp-process/jars/

docker image rm csruiliu/rotary-aqp-load:latest
docker image rm csruiliu/rotary-aqp-process:latest

docker build --no-cache -t csruiliu/rotary-aqp-load $HOME/Develop/docker-files/rotary-aqp-load
docker build --no-cache -t csruiliu/rotary-aqp-process $HOME/Develop/docker-files/rotary-aqp-process
