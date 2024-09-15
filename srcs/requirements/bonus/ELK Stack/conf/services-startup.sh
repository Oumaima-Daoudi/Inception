#!/bin/bash

# Start Elasticsearch service
service elasticsearch start

# Start Logstash service
service logstash start

# Start Kibana service
service kibana start

# Keep the container running
tail -f /dev/null
