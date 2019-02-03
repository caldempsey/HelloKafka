HelloKafka
===

Hello Kafka is a learning repository responsible for containing Docker and Docker compose. It comes bundled with configuration for an introductory Kafka setup (no ensemble as of yet, but soon), as well as some hints, tips, notes, and guidelines as part of the organised documentation. Use me when you need Kafka, fast!

A primer to Kafka Streams 
---

The Kafka streams library was introduced as part of Kafka 0.10 (~2016). It has fully matured as part of Kafka's development, releasing its first "production stable" version as of June 2017.

A Kafka streams application is a standard Java application integrated with the Kafka Streams API. There is no need to create a seperate Kafka cluster. As such, a Kafka Streaming cluster inherits every benefit which Kafka provides (in being highly scalable, elastic, and fault tolerant). Using Kafka, the library is able to provide streaming exactly once capabilities which is a huge deal in the streaming world (records are processed one at a time and there is no batching). 

Word on the street has it that Kafka streams is a serious contender to other processing frameworks (NiFi, Spark, Flink, Kibana). However, as a new library the streaming library is prone to future changes, so it's important to constrain the features you will choose to implement and ensure version consistency across each build of your Kafka streaming application. 

A Common Kafka Streams Architecture Design
---

The architecture of this Kafka streams application has the following componenets.

- Sources, responsible for providing data.
- Connect cluster workers, responsible for onboarding data to the Kafka Streams application (i.e. as objects in memory), and offloading data to sinks. 
- Kafka, responsible for providing a set of brokers.
- Kafka streaming applications, responsible for using the brokers in the Kafka streaming API to transform data. 
- Sinks, exposed transformed data, where it is not necessarily the case that all data transformations are exposed.

# Reasoning

Naming conventions for configuration and deployment shells scripts have been chosen to keep everything tidily together when viewing files from a-z (no scrolling).