# iOQP-Process #

## Dependency ##

1. jdk 1.8 (301)
2. scala 2.11.12
3. spark 2.4.0 (hadoop2.6)
4. inqp-load containter (launch and setup) 

## Run ##

### Run docker container ### 

+ docker run -it -P -v /home/ruiliu/Develop/ioqp/scripts:/home/scripts --hostname southport --name southport_container --link lincoln_container --rm csruiliu/ioqp-process 

### Inside docker container ### 

+ /home/deploy_scripts/ioqp-process.sh

### Detailed Steps ###

+ `passwd` (set new password) and `/etc/init.d/ssh start`
+ $SPARK_HOME/sbin/start-all.sh

Then, we can get the data from inqp-load container and run some query processing jobs, like `run_tpch_test.sh`