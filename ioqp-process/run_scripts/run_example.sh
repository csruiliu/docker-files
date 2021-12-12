#!/bin/bash

SPARK_HOME=/tank/hdfs/totem/slothdb/spark

$SPARK_HOME/bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://lincoln:7077 \
  --executor-memory 20G \
  --total-executor-cores 20 \
  $SPARK_HOME/jars/spark-examples_2.11-2.4.0.jar \
  1000

