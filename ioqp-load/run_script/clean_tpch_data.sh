#!/bin/sh

tpch_data_dir=/tank/hdfs/totem/slothdb/slothdb_test/tpch_data

for table in customer lineitem nation orders part partsupp region supplier
do
	rm $tpch_data_dir/${table}_large/*
done

