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
input_partition=20
#java_opt="spark.executor.extraJavaOptions=-verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xms100G -XX:+UseParallelGC -XX:+UseParallelOldGC"
java_opt="spark.executor.extraJavaOptions=-Xms${max_mem} -XX:+UseParallelGC -XX:+UseParallelOldGC "
largedataset=false # largedataset: Q2, Q11, Q13, Q16, Q22 
		   # smalldataset: Q1, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q12, Q14, Q15, Q17, Q18, Q19, Q20, Q21
		   # small, non-incrementable: Q15 Q17 Q18 Q20 Q21
		   # executed query: q2, q11, q13, q15, q17, q22

## 0: querypath-aware, 1: subplan-aware, 2: IncObv,
## 3: IncStat, collect cardinality groudtruth
## 4: Run $batch_num, collect selectivities
execution_mode=3

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

## Max step
## Sample time
sample_time=(0.069 0.172 0.250 0.274 0.254)
max_step=(20 40 60 80 100)

#for query in q1 q3 q4 q5 q6 q7 q8 q9 q10 q12 q14 q18 q19 q20 q21
#for query in q18 q20 
#for query in q15 q17 q18 q20 q21
for query in q17
do
	for execution_mode in 0
	do
		#for constraint in 0.1
		#for batch_num in 20 10 5 2
		#for inc_percentage in 0.1
		#for inc_percentage in 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0
		#for cost_bias in -5 -4 -3 -2 1 2 3 4 5
		#for cost_bias in 4.0
		for idx in 0 1 2 3 4 
		do
			for i in 0 1 2 3 4 5 6 7 8 9
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

