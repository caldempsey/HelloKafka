# Acquire Open JDK required to run Scala applications from a maintained source.
FROM openjdk:8u191-jre-alpine
# Create and set our working directory.
WORKDIR /etc/kafka
# Download Kafka to the working directory. 
# Install dependencies for the install script. 
RUN apk add jq
# Download kafka using the download script. 
COPY ./install_kafka.sh .
RUN chmod +x install_kafka.sh
RUN install_kafka.sh
