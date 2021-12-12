#!/bin/sh

SPARK_HOME=/tank/hdfs/totem/slothdb/spark

$SPARK_HOME/sbin/stop-all.sh
$SPARK_HOME/sbin/start-all.sh
