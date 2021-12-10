# InQP-Load #

## Dependency ##

1. hadoop 2.6.5
2. jdk 1.8 (301)
3. kafka 2.11-2.1.0

## Run ##

### Run docker container ### 

1. docker run -it -P -v /home/ruiliu/Develop/tpch-data:/home/tpch-data --hostname lincoln --rm csruiliu/inqp-load 

### Inside docker container ### 

0. `passwd` (set new password) and `/etc/init.d/ssh start`
1. take /home as workdir
2. nohup zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties > zookeeper.out 2>&1 &
3. nohup kafka-server-start.sh $KAFKA_HOME/config/server.properties > kafka.out 2>&1 &
4. /home/deploy_script/create_topic.sh
5. hdfs namenode -format
6. start-dfs.sh
7. /home/deploy_script/reset.sh

Starting another terminal process on the same container by

`docker exec -it <container_id> bash`

Then, run `/home/deploy_script/get_offset.sh` to see the loading progress 
