#!/bin/bash

SPARK_HOME=/tank/hdfs/totem/slothdb/spark

hdfs_root=hdfs://southport:9000
kafka_bootstrap=lincoln:9092
SF=10
max_core=20
max_mem=150G
master=spark://southport:7077
shuffle_num=20
stat_dir=/tank/hdfs/totem/slothdb/slothdb_test/stat_dir
query=q17
batch_num=20
execution_mode=3
input_partition=20
#java_opt="spark.executor.extraJavaOptions=-verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xms100G -XX:+UseParallelGC -XX:+UseParallelOldGC"
java_opt="spark.executor.extraJavaOptions=-Xms150G -XX:+UseParallelGC -XX:+UseParallelOldGC "
constraint=0.1
largedataset=false # largedateset: Q2, Q11, Q13, Q22

#for query in q2 q11 q13 q15 q16 q22 Q_HighBalance
for query in q17
do
	#for constraint in 0.99
	for batch_num in 10
	do
		for SF in 10
		do
			$SPARK_HOME/bin/spark-submit \
			       	--total-executor-cores $max_core \
			       	--executor-memory $max_mem \
			       	--class totem.middleground.tpch.QueryTPCH \
			       	--master $master \
				--conf "${java_opt}" \
				$SPARK_HOME/jars/totem-middle-ground_2.11-2.4.0.jar \
			       	$kafka_bootstrap \
			       	$query \
			       	$batch_num \
				$shuffle_num \
				$stat_dir \
			       	$SF \
			       	$hdfs_root \
				$execution_mode \
				$input_partition \
				$constraint \
				$largedataset
		done
	done
done

