# iOQP-Compile #

## Dependency ##

1. openjdk 1.8 (292)
2. maven 3.8.4 (latest version at the time of development)
3. scala 2.11.12

## Run ##

### Run docker container ### 

1. docker run -it -P -v /home/ruiliu/Develop/ioqp:/home/ioqp --rm csruiliu/ioqp-compile 

### Inside docker container ### 

1. ioqp/build/mvn clean
2. ioqp/build/sbt [java-home has been set]
3. type `project middle-ground` and `package` during the sbt compilation
4. extract ioqp/middle-ground/target/scala-2.11/totem-middle-ground_2.11-2.4.0.jar 

