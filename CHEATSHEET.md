Cheatsheet
===

A cheatsheet of commands which may be useful in the future. 

# Built a container from the local dockerfile with the tag kafka 
`docker build . -t kafka`
# Break into a new container built the kafka tag by executing sh.
`docker run --name kafka -it kafka /bin/sh`
# All together but using bash instead of sh (which we need to use Kafka's shell scripts btw)
`docker build . -t kafka && docker run --name kafka -it kafka /bin/bash`

# Start Kafka with config specified in config/ 
`kafka-server-start.sh config/server.properties`

# Start a Zookeeper instance with config specified in config/ 
`zookeeper-server-start.sh config/zookeeper.properties config/server.properties`

# Start Kafka and Zookeeper with config specified in config/ using a shell script.

`./runserver.sh`