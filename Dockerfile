# Acquire Open JDK required to run Scala applications from a maintained source.
FROM openjdk:8u191-jre-alpine
LABEL author="github.com/mmacheerpuppy"
# Install other Kafka dependencies (bash is actually one of them to run the zookeeper server start scripts)
RUN apk add bash
# Create and set our working directory.
WORKDIR /etc/kafka
# Download Kafka to the working directory. 
# Install dependencies for the install script. 
RUN apk add jq
RUN apk add curl
# Install Kafka using external script
COPY ./kafka/install.sh .
RUN chmod +x ./install.sh
RUN ./install.sh
# Configure Kafka using external script.
COPY ./kafka/configure.sh .
COPY kafka/configure/ configure/
RUN chmod +x ./configure.sh
RUN ./configure.sh
# Cleanup installation and configuration using cleanup_crew script (responsible for cleaning up dependencies).
COPY ./kafka/cleanup.sh .
RUN chmod +x ./cleanup.sh
RUN ./cleanup.sh
RUN rm cleanup.sh
# Update PATH with Kafka executables. 
ENV PATH "/etc/kafka/bin:${PATH}"
# Copy runserver script (use this if implementing ).
COPY ./kafka/runserver.sh . 
RUN chmod +x ./runserver.sh
# Copy a README for confused others.
COPY kafka/README.md .
# Expose Zookeeper (not sure if this is necessary).
EXPOSE 2181
# Expose bootstrap servers.
EXPOSE 9092
CMD ./runserver.sh