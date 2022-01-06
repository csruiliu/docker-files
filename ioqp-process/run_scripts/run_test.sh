#!/bin/bash

## the total number of logical cores that spark-shell can use
max_core=14

## master node url for the cluster
master=spark://southport:7077

## max memory for each executor
max_mem=10G

## supply configuration for jre
java_opt="spark.executor.extraJavaOptions=-Xms${max_mem} -XX:+UseParallelGC -XX:+UseParallelOldGC "

## entry point for your application
entry_class=ruiliu.relaqs.sch.Scheduler

$SPARK_HOME/bin/spark-submit --total-executor-cores $max_core \
                             --executor-memory $max_mem \
                             --class $entry_class \
                             --master $master \
                             --conf "${java_opt}" \
                                 $SPARK_HOME/jars/ruiliu-relaqs_2.11-2.4.0.jar
