#!/bin/bash

SPARK_HOME=/tank/hdfs/totem/slothdb/spark

hdfs_root=hdfs://southport:9000
kafka_bootstrap=lincoln:9092
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
largedataset=true # largedateset: Q2, Q11, Q13, Q16, Q22
SF=100
iolap=1
iolaproot=/tank/hdfs/totem/slothdb/slothdb_test/iolap

for query in Q22
do
	#for execution_mode in 0 2
	for execution_mode in 3
	do
		#for constraint in 0.2
		for batch_num in 100
		do
			#for i in 0 1 2
			for i in 0
			do
				$SPARK_HOME/bin/spark-submit \
				       	--total-executor-cores $max_core \
				       	--executor-memory $max_mem \
				       	--class totem.middleground.tpch.CardTPCH \
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
					$largedataset \
					$iolap \
					$iolaproot
			done
		done
	done
done

