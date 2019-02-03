#!/bin/sh

# Case where configuration directory does not exist.
if [ ! -d "kafka_configuration" ]; then 
    echo "Configuration directory not located, terminating."
    exit 1
fi
# Create a Zookeeper data directory.
mkdir data && mkdir data/zookeeper
# Replace all files within kafka_configuration with the new configuration.
cp -r -f kafka_configuration/. config/
