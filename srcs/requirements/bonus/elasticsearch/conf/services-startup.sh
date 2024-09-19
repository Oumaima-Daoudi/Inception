#!/bin/bash

# Start Elasticsearch service
service elasticsearch start

# # Enable and set up Filebeat service
filebeat modules enable system
filebeat setup -e
service filebeat start
service filebeat enable

tail -f /dev/null



