# InQP-Load #

## Dependency ##

1. jdk 1.8 (301)
2. spark 2.4.0 (hadoop2.6)
3. inqp-load containter (launch and setup) 

## Run ##

### Run docker container ### 

1. docker run -it -P --hostname southport --name southport_container --link <inqp-load_container_name> --rm csruiliu/inqp-process 

### Inside docker container ### 

1. `passwd` (set new password) and `/etc/init.d/ssh start`
2. start-all.sh [spark]

Then, we can get the data from inqp-load container and run some query processing jobs, like `run_smalldataset.sh`