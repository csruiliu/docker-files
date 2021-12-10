# InQP-Load #

## Dependency ##

1. hadoop 2.6.5
2. jdk 1.8 (301)
3. kafka 2.11-2.1.0
4. spark 2.4.0 (hadoop2.6)
5. scala 2.11.12

## Run ##

### Run docker container ### 

1. docker run -it -P -v /home/ruiliu/Develop/tpch-data:/home/tpch-data --hostname lincoln --name lincoln_container --rm csruiliu/inqp-load 

### Inside docker container ### 

1. `passwd` (set new password) and `/etc/init.d/ssh start`
2. take /home as workdir
3. nohup zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties > zookeeper.out 2>&1 &
4. nohup kafka-server-start.sh $KAFKA_HOME/config/server.properties > kafka.out 2>&1 &
5. /home/deploy_script/create_topic.sh
6. hdfs namenode -format
7. start-dfs.sh [hadoop]
8. start-all.sh [spart]
9. /home/deploy_script/reset.sh to remove checkpoint files

Starting another terminal process on the same container by

```
docker exec -it <container_id> bash
```

Then, run `/home/deploy_script/get_offset.sh` to see the loading progress 
