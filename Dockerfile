# Acquire Open JDK required to run Scala applications from a maintained source.
FROM openjdk:8u191-jre-alpine
# Install other Kafka dependencies (bash is actually one of them to run the zookeeper server start scripts)
RUN apk add bash
# Create and set our working directory.
WORKDIR /etc/kafka
# Download Kafka to the working directory. 
# Install dependencies for the install script. 
RUN apk add jq
RUN apk add curl
# Install Kafka using external script
COPY ./kafka_install.sh .
RUN chmod +x ./kafka_install.sh
RUN ./kafka_install.sh
# Configure Kafka using external script.
COPY ./kafka_configure.sh .
COPY kafka_configuration/ kafka_configuration/
RUN chmod +x ./kafka_configure.sh
RUN ./kafka_configure.sh
# Cleanup installation and configuration using cleanup_crew script (responsible for cleaning up dependencies).
COPY ./kafka_cleanup.sh .
RUN chmod +x ./kafka_cleanup.sh
RUN ./kafka_cleanup.sh
RUN rm kafka_cleanup.sh
# Update PATH with Kafka executables. We have
ENV PATH "/etc/kafka/bin:${PATH}"
# Copy a README for confused others.
COPY KAFKA_README.md HELPME.md
# Expose port.
EXPOSE 2181
