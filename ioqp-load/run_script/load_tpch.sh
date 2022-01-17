#!/bin/sh

DATA_ROOT=file:///home/tpch-data

checkpoint=hdfs://lincoln:9000/tpch-checkpoint

master=local[14]
largedataset=false

$SPARK_HOME/bin/spark-submit \
	--class ruiliu.aqp.tpch.LoadTPCH \
	--master $master $SPARK_HOME/jars/ruiliu-aqp_2.11-2.4.0.jar \
	lincoln:9092 \
	$DATA_ROOT \
	$checkpoint \
	$largedataset

