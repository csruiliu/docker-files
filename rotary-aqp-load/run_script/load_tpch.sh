#!/bin/sh

DATA_ROOT=file:///home/tpch-data

# checkpoint=hdfs://lincoln:9000/tpch-checkpoint
checkpoint=file:///home/tpch-checkpoint

# Run Spark locally with K worker threads if local[K]
# Ideally, set this to the number of cores on your machine
# master=local[20]
master=local
largedataset=false

$SPARK_HOME/bin/spark-submit \
	--class ruiliu.aqp.tpch.LoadTPCH \
	--master $master $SPARK_HOME/jars/ruiliu-aqp_2.11-2.4.0.jar \
	lincoln:9092 \
	$DATA_ROOT \
	$checkpoint \
	$largedataset

