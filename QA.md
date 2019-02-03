- With Docker and Kafka, how do I work towards creating the topics I want to build?

Working on this.

- How do we know our data is written?

Kafka supports acknowledgements, try specifying acks=all when defining for your Kafka producer. 

- Q: Why can't I start my Kafka server.

You're probably facing Docker issues. Try removing your container.