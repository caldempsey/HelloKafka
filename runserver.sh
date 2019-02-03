#!/bin/bash

echo "A script to execute a Kafka server in the foreground with the
minimally known configuration."
zookeeper-server-start.sh -daemon config/zookeeper.properties
kafka-server-start.sh config/server.properties