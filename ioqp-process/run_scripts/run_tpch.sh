#!/bin/bash

SPARK_HOME=/tank/hdfs/totem/slothdb/spark

if [ $# -ne 2 ]
then
    echo "Need two parameters: <query name> <number of batches>"
    exit
fi

hdfs_checkpoint=hdfs://southport:9000/tpch_checkpoint
kafka_bootstrap=lincoln:9092
SF=10
max_core=20
max_mem=100G
master=spark://southport:7077

$SPARK_HOME/bin/spark-submit --total-executor-cores $max_core --executor-memory $max_mem --class totem.middleground.tpch.QueryTPCH --master $master $SPARK_HOME/jars/totem-middle-ground_2.11-2.4.0.jar $kafka_bootstrap $1 $2 $SF $hdfs_checkpoint

