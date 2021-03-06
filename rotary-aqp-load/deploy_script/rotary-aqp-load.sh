#!/bin/bash

/etc/init.d/ssh start
sleep 2
nohup zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties > zookeeper.out 2>&1 &
sleep 1
nohup kafka-server-start.sh $KAFKA_HOME/config/server.properties > kafka.out 2>&1 &
sleep 1
/home/deploy_script/create_topic.sh
sleep 1
hdfs namenode -format
sleep 1
/home/deploy_script/setup-password.sh
/home/deploy_script/setup-hadoop.sh
/home/deploy_script/setup-spark.sh
sleep 1
/home/run_script/load_tpch.sh
