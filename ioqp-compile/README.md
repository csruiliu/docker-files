# iOQP-Compile #

## Dependency ##

1. JDK 8 (301)
2. scala 2.11.12

## Run ##

### Run docker container ### 

1. docker run -it -P -v /home/ruiliu/Develop/ioqp:/home/ioqp --rm csruiliu/ioqp-compile 

### Inside docker container ### 

1. cd /home/ioqp
2. ./build/mvn clean
3. ./build/sbt [java-home should be set]
4. type `project middle-ground` and `package` during the sbt compilation
5. extract necessary jars by running `deploy-jars.sh`
6. add `kafka-client-xxx.jar` from the `libs` folder in Kafka project to the jars files of `ioqp-load` and `ioqp-process` 
