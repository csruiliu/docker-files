#!/bin/sh

PARTITION=20

kafka-topics.sh -zookeeper localhost:2181 --create --topic Supplier --partitions $PARTITION --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Part --partitions $PARTITION --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic PartSupp --partitions $PARTITION --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Customer --partitions $PARTITION --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Orders --partitions $PARTITION --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Lineitem --partitions $PARTITION --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Nation --partitions $PARTITION --replication-factor 1
kafka-topics.sh -zookeeper localhost:2181 --create --topic Region --partitions $PARTITION --replication-factor 1
