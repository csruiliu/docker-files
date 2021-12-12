#!/bin/bash

SPARK_HOME=/tank/hdfs/totem/slothdb/spark

if [ $# -ne 2 ]
then
    echo "Need two parameters: <query name> <number of batches>"
    exit
fi

checkpoint=hdfs://lincoln:9000/tpch_checkpoint

$SPARK_HOME/bin/spark-submit --total-executor-cores 20 --executor-memory 100G --class totem.middleground.tpch.QueryTPCH --master spark://lincoln:7077 $SPARK_HOME/jars/totem-middle-ground_2.11-2.4.0.jar lincoln:9092 $1 $2 10 $checkpoint

