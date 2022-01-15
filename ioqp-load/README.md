# iOQP-Load #

## Dependency ##

1. hadoop 2.6.5
2. jdk 1.8 (301)
3. scala 2.11.12
4. kafka 2.11-2.1.0
5. spark 2.4.0 (hadoop2.6)

## Run ##

### Run docker container ### 

+ docker run -it -P -v /home/ruiliu/Develop/tpch-data:/home/tpch-data --hostname lincoln --name lincoln_container --rm csruiliu/ioqp-load 

### Inside docker container ### 

Deploying ioqp-load

+ /home/deploy_script/ioqp-load.sh

### Detailed Step ###

+ `passwd` (set new password) and `/etc/init.d/ssh start`
+ nohup zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties > zookeeper.out 2>&1 &
+ nohup kafka-server-start.sh $KAFKA_HOME/config/server.properties > kafka.out 2>&1 &
+ /home/deploy_script/create_topic.sh
+ hdfs namenode -format
+ $HADOOP_HOME/sbin/start-dfs.sh
+ $SPARK_HOME/sbin/start-all.sh
+ /home/deploy_script/reset.sh to remove checkpoint files, if necessary

Then, run `/home/run_script/load_tpch.sh` to start loading data.

Starting another terminal process on the same container by

```
docker exec -it <container_id> bash
```

Running `/home/run_script/get_offset.sh` to see the loading progress 
