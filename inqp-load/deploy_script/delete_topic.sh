#!/bin/sh

kafka-topics.sh -zookeeper localhost:2181 --delete --topic Supplier
kafka-topics.sh -zookeeper localhost:2181 --delete --topic Part
kafka-topics.sh -zookeeper localhost:2181 --delete --topic PartSupp
kafka-topics.sh -zookeeper localhost:2181 --delete --topic Customer
kafka-topics.sh -zookeeper localhost:2181 --delete --topic Orders
kafka-topics.sh -zookeeper localhost:2181 --delete --topic Lineitem
kafka-topics.sh -zookeeper localhost:2181 --delete --topic Nation
kafka-topics.sh -zookeeper localhost:2181 --delete --topic Region
 