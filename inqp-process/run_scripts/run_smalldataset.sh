#!/bin/bash

hdfs_root=hdfs://southport:9000
kafka_bootstrap=lincoln:9092
SF=5
max_core=14
max_mem=20G
master=spark://southport:7077
shuffle_num=20
stat_dir=/home/run_scripts/stat_dir
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
execution_mode=0

## 0: turn off iOLAP, 1: turn on iOLAP
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
max_step=100

## Sample time
sample_time=0.07

## Spike rate
spike_rate=1.0

for query in q1
#for query in q1 q3 q4 q5 q6 q7 q8 q9 q10 q12 q14 q17 q18 q19 q20 q21
do
	for execution_mode in 0
	do
		#for constraint in 0.02 0.05 0.1 0.2 0.5
		#for constraint in 0.05
		#for batch_num in 1
		#for inc_percentage in 0.1
		#for inc_percentage in 0.0 0.2 0.4 0.6 0.8 1.0
		#for cost_bias in -5
		#for spike_rate in 5.0 
		for spike_rate in 1.0
		#for cost_bias in 4.0
		#for max_step in 100 200 300 400 500 600 700 800 900 1000
		do
			for i in 0
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
					$max_step \
					$sample_time \
					$spike_rate
			done
		done
	done
done

