# HelloKafka


What am I?
--- 

I am a repository for providing Kafka instances through Docker and Docker Compose.

What is inside me?
---

Currently I come bundled with configuration for a introductory Kafka setup (no ensemble as of yet), as well as some hints, tips, notes, and guidelines as part of the organised documentation. Use me when you need Kafka, fast! Currently I only run a minimal possible implementation, but this will be updated as and when my master needs more functionality for his development servers.

As a default, Kafka stores its logs in data/kafka and Zookeeper stores its data in data/zookeeper. We use the built in (development) zookeeper (for now).

Getting Started
---

Currently the easiest way to get going _and start playing around_ is to create an instance of HelloKafka and make use of the `runserver.sh` shell script i.e. `docker build . -t hellokafka && docker run --name hellokafka -it kafka /bin/bash` (so overriding the CMD of the Dockerfile) and once you're in the container `./runserver.sh`. 

Since the Dockerfile specifies the command `./runserver` to be executed by default it suffices to execute `docker run --name kafka -it kafka` in place of the latter, so `docker build . -t kafka && docker run --name kafka -it kafka`. If Kafka stops the container will be exited.

# Current and Future Work

Design Choices
---

Naming conventions for configuration and deployment shells scripts have been chosen to keep everything tidily together when viewing files from a-z (no scrolling).

Things to Improve
--- 

We need to make the Kafka logs directory configurable by PATH rather than static defaults.

We need to decouple the Dockerfile from zookeeper configuration and use Docker compose to create a Zookeeper cluster and a Kafka ensemble. 