# HelloKafka


What am I?
--- 

I am a repository for bootstrapping Kafka instances through Docker and Docker Compose.

What do I do?
---

Currently I come bundled with configuration for a introductory Kafka setup (no ensemble as of yet), as well as some hints, tips, notes, and guidelines as part of the organised documentation. Use me when you need Kafka, fast! Currently I only run a minimal possible implementation, but this will be updated as and when my master needs more functionality for his development servers. The minimal possible implementation is deployed using execution scripts found in the `kafka/` directory.

As a default, Kafka stores its logs in data/kafka and Zookeeper stores its data in data/zookeeper. We use the built in (development) zookeeper (for now).

Getting Started
---

You should probably know a thing or two about Docker before using this build, but if you don't never fear. What's important is you know the basics of Kafka and have a clean Docker installation.

The Dockerfile specifies the command `./runserver` to be executed by default, so it is sufficient to execute `docker build . -t hellokafka && docker run --name hellokafka -it hellokafka`. Straight from the source this command is the fastest way to get up and running.

To break into the container or create an instance of HelloKafka and make use of the `runserver.sh` shell script you may want to consider syntax similar to `docker build . -t hellokafka && docker run --name hellokafka -it kafka /bin/bash`. The difference here is specification of `/bin/bash` in place of the latter. This overrides the CMD specified by the Dockerfile. Once you're in the container `./runserver.sh` at your leisure. 

With this in mind, if Kafka stops the `runserver.sh` script will terminate and the container will be exited (which is de-facto behaviour of Docker instances). 

It is important to note that since the setup does not yet make use of any volumes and currently spawns only one instance, topics can only have a replication factor of 1 (you can't have a replication factor greater than the number of available brokers) and will not be persisted across container exits.

# Current and Future Work

Design Choices
---

- Naming conventions for configuration and deployment shells scripts have been chosen to keep everything tidily together when viewing files from a-z (no scrolling).

Things to Improve
--- 

- We need to make the Kafka logs directory configurable by PATH rather than static defaults.

- We need to decouple the Dockerfile from zookeeper configuration and use Docker compose to create a Zookeeper cluster and a Kafka ensemble. 

- Add a test application which runs before the main execution script `runserver.sh`?

- Cleanup dockerfile (lots of needless copy syntax which can be reduced).

- Clustering.