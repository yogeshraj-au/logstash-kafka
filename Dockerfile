#FROM docker.elastic.co/logstash/logstash:8.7.1
FROM opensearchproject/logstash-oss-with-opensearch-output-plugin:7.13.2

# Copy the Logstash configuration file
COPY kafka.conf /usr/share/logstash/pipeline/

# Install Logstash plugins if needed
RUN logstash-plugin install logstash-integration-kafka

# Start Logstash
CMD ["-f", "/usr/share/logstash/pipeline/kafka.conf"]
