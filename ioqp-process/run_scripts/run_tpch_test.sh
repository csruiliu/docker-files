#!/bin/bash

stat_dir=/home/run_scripts/stat_dir

## master node url for the cluster
master=spark://southport:7077

## hdfs url for the cluster
hdfs_root=hdfs://southport:9000

## kafka bootstrap server
kafka_bootstrap=lincoln:9092

## scale factor for tpch dataset
scale_factor=5 

# sample ratio for running
sample_ratio=1.0

## the total number of logical cores that spark-shell can use
max_core=14

## max memory for each executor 
max_mem=10G

## entry point for your application
entry_class=ruiliu.relaqs.tpch.QueryTPCH

## number of shuffle for entry class
shuffle_num=20

## number of batch for entry class
batch_num=20

## number of partition for input dataset
input_partition=20

## supply configuration for jre
java_opt="spark.executor.extraJavaOptions=-Xms${max_mem} -XX:+UseParallelGC -XX:+UseParallelOldGC "

## largedataset: Q2, Q11, Q13, Q16, Q22 
## smalldataset: Q1, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q12, Q14, Q15, Q17, Q18, Q19, Q20, Q21
## small, non-incrementable: Q15 Q17 Q18 Q20 Q21
## executed query: q2, q11, q13, q15, q17, q22
largedataset=false

## 0: querypath-aware 
## 1: subplan-aware
## 2: IncObv
## 3: IncStat, collect cardinality groudtruth
## 4: Run $batch_num, collect selectivities
execution_mode=0

## 0: turn off iOLAP 
## 1: turn on iOLAP
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

## Trigger interval (milliseconds)
trigger_interval=100

## Aggregation interval (milliseconds)
aggregation_interval=50

## qury for testing
query=q1

$SPARK_HOME/bin/spark-submit --total-executor-cores $max_core \
                             --executor-memory $max_mem \
                             --class $entry_class \
                             --master $master \
                             --conf "${java_opt}" \
                                $SPARK_HOME/jars/ruiliu-relaqs_2.11-2.4.0.jar \
                                $kafka_bootstrap \
                                $query \
                                $batch_num \
                                $shuffle_num \
                                $stat_dir \
                                $scale_factor \
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
                                $sample_ratio \
				$trigger_interval \
                                $aggregation_interval
