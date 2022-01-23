# iOQP-Process #

## Dependency ##

+ jdk 1.8 (301)
+ scala 2.11.12
+ spark 2.4.0 (hadoop2.6)
+ inqp-load containter (launch and setup) 

## Run ##

### Run docker container ### 

+ docker run -it -P -v /home/ruiliu/Develop/ioqp/preemption:/home/preemption --hostname southport --name southport_container --link lincoln_container --rm csruiliu/ioqp-process 
l
### Inside docker container ### 

+ /home/deploy_scripts/ioqp-process.sh

Detailed steps in the `ioqp-process.sh`:

1. `passwd` (set new password) and `/etc/init.d/ssh start`
2. $SPARK_HOME/sbin/start-all.sh

Then, we can get the data from inqp-load container and run some query processing jobs, like `run_tpch_test.sh`