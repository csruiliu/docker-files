# Rotary-AQP-Compile #

## Dependency ##

+ JDK 8 (301)
+ scala 2.11.12

## Run ##

### Run docker container ### 

+ docker run -it -v /home/ruiliu/Develop/rotary-aqp:/home/rotary-aqp --rm csruiliu/rotary-aqp-compile 

### Inside docker container ### 

1. ./build/mvn clean
2. ./build/sbt [java-home should be set]
3. type `project aqp` and `package` during the sbt compilation
4. extract necessary jars by running `deploy-jars.sh`
5. add `kafka-client-xxx.jar` from the `libs` folder in Kafka project to the jars files of `rotary-aqp-load` and `rotary-aqp-process` 
