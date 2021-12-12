#!/bin/bash

SPARK_HOME=/tank/hdfs/totem/slothdb/spark

hdfs_root=hdfs://lincoln:9000
kafka_bootstrap=lincoln:9092
max_core=20
max_mem=150G
master=spark://southport:7077
shuffle_num=20
stat_dir=/tank/hdfs/totem/slothdb/slothdb_test/stat_dir
query=q17
batch_num=20
input_partition=20
#java_opt="spark.executor.extraJavaOptions=-verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xms100G -XX:+UseParallelGC -XX:+UseParallelOldGC"
java_opt="spark.executor.extraJavaOptions=-Xms${max_mem} -XX:+UseParallelGC -XX:+UseParallelOldGC "
largedataset=true # largedateset: Q2, Q11, Q13, Q16, Q22
SF=100

## 0: querypath-aware, 1: subplan-aware, 2: IncObv,
## 3: IncStat, collect cardinality groudtruth
## 4: Run $batch_num, collect selectivities
## 5: Test SlothOverhead
execution_mode=5

## 0: turn on iOLAP, 1: turn off iOLAP
iolap=0

## Percentage of choosing the right incrementability
inc_percentage=1.0

## Bias of statistical information 
cost_bias=1.0

## Performance goal
## smaller than 1.0 -> latency constraint
## larger  than 1.0 -> resource constraint
constraint=0.05

## Sample time
sample_time=(0.087 0.188 0.253 0.363 0.491)
max_step=(20 40 60 80 100)

for query in Q2
#for query in Q_Anti Q_Outer Q_Agg Q_AggJoin
do
	for execution_mode in 0
	do
		#for constraint in 0.02 0.05 0.1 0.2 0.5 1.0
		#for constraint in 0.1
		#for batch_num in 20 10 5 2
		#for inc_percentage in 1.0 0.8 0.6 0.4 0.2 0
		#for inc_percentage in 1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0
		#for cost_bias in -5 -4 -3 -2 1 2 3 4 5
		for idx in 0 1 2 3 4
		do
			for i in 0 1 2 3 4 5 6 7 8 9 10
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
					$largedataset \
					$iolap \
					$inc_percentage \
					$cost_bias \
					${max_step[$idx]} \
					${sample_time[$idx]}
			done
		done
	done
done

