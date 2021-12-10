#!/bin/sh
 
kafka-topics.sh -zookeeper localhost:2181 --create --topic Supplier --partitions 20 --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Part --partitions 20 --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic PartSupp --partitions 20 --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Customer --partitions 20 --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Orders --partitions 20 --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Lineitem --partitions 20 --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Nation --partitions 20 --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Region --partitions 20 --replication-factor 1
