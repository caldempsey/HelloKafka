#!/bin/sh

echo "Inserting configuration defined by configure/"
# Case where configuration directory does not exist.
if [ ! -d "configure" ]; then 
    echo "Configuration directory not located, terminating."
    exit 1
fi
# Create a Zookeeper data directory and Kafka data directory.
mkdir data && mkdir data/zookeeper && mkdir data/kafka
# Replace all files within kafka_configuration with the new configuration.
cp -r -f configure/. config/
echo "Complete."