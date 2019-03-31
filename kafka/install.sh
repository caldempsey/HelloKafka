#!/bin/sh

set -e

# Dependencies: jq

# Create a variable representing the response of whether the target package can be found, the JSON key will contain the meaningful URL of the target package as a truthy response (which we assign). 
echo "Downloading kafka 2.1.1-2.1.0"
url=$(curl --stderr /dev/null "https://www.apache.org/dyn/closer.cgi?path=/kafka/2.1.0/kafka_2.11-2.1.0.tgz&as_json=1" | jq -r '"\(.preferred)\(.path_info)"')
# If the target package cannot be found, terminate the script.
if [[ -z "$url" ]]; then
	echo "Unable to determine mirror for downloading Kafka, the service may be down"
	exit -1
fi
# Otherwise pull the repository.
echo "Downloading Kafka tar from $url and saving as kafka_2.11-2.1.0.tgz. If this hangs try re-running the script (will grab a new source)."
wget "${url}" -O "/etc/kafka/kafka_2.11-2.1.0.tgz"
# Install Kafka to /kafka (by stripping the trailing underscore)
tar -xzf kafka_2.11-2.1.0.tgz --strip 1
# Cleanup 
echo "Extraction complete, cleaning up binaries."
rm kafka_2.11-2.1.0.tgz
echo "Complete."
