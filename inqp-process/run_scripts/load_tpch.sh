#!/bin/sh

SPARK_HOME=/tank/hdfs/totem/slothdb/spark
DATA_ROOT=/tank/hdfs/totem/slothdb/slothdb_test/tpch_data

checkpoint=hdfs://lincoln:9000/tpch_checkpoint

$SPARK_HOME/bin/spark-submit --class totem.middleground.tpch.LoadTPCH --master spark://lincoln:7077 $SPARK_HOME/jars/totem-middle-ground_2.11-2.4.0.jar lincoln:9092 $DATA_ROOT $checkpoint

