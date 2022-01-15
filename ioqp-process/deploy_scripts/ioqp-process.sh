#!/bin/bash

/etc/init.d/ssh start
sleep 1
./setup-password.sh
sleep 1
./setup-spark.sh
sleep 1
/home/run_scripts/run_tpch_test.sh
