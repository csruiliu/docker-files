# iOQP-Process #

## Dependency ##

1. jdk 1.8 (301)
2. scala 2.11.12
3. spark 2.4.0 (hadoop2.6)
4. inqp-load containter (launch and setup) 

## Run ##

### Run docker container ### 

1. docker run -it -P --hostname southport --name southport_container --link lincoln_container --rm csruiliu/ioqp-process 

### Inside docker container ### 

1. `passwd` (set new password) and `/etc/init.d/ssh start`
2. $SPARK_HOME/sbin/start-all.sh

Then, we can get the data from inqp-load container and run some query processing jobs, like `run_smalldataset.sh`