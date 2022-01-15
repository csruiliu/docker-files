#!/bin/bash

/etc/init.d/ssh start
sleep 2
/home/deploy_scripts/setup-password.sh
sleep 1
/home/deploy_scripts/setup-spark.sh
sleep 1
/home/run_scripts/run_tpch_test.sh
