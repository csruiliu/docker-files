#!/bin/sh

DIRS="5GB_Q1_1-5 5GB_Q1_1-10 5GB_Q1_1-100 5GB_Q3_1x10 5GB_Q3_2x10 5GB_Q3_3x10 5GB_Q3_4x10"
dbgen_dir=/tank/hdfs/totem/slothdb/dbgen
tpch_data_dir=/tank/hdfs/totem/slothdb/slothdb_test/tpch_data

for DIR in $DIRS
do
    for table in orders lineitem customer part partsupp supplier nation region
    do

        echo "Started $table"
        if ! [[ -d $tpch_data_dir/$DIR/${table} ]]; then
            mkdir $tpch_data_dir/$DIR/${table}
        fi
        cp $tpch_data_dir/$DIR/${table}.tbl $tpch_data_dir/$DIR/${table}/

        echo "Finished $table"
    done
done
