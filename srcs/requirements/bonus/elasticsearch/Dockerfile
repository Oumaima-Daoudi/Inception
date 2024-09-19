FROM debian:bullseye

RUN apt-get update && apt-get -y install apt-transport-https openjdk-11-jdk wget procps curl sysvinit-utils

RUN apt-get -y install gnupg2 && \
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - 

RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list

RUN apt-get update && apt-get install -y elasticsearch

COPY ./conf/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.15.1-amd64.deb && \
    dpkg -i filebeat-8.15.1-amd64.deb

COPY ./conf/filebeat.yml /etc/filebeat/filebeat.yml

RUN chmod go-w /etc/filebeat/filebeat.yml

# Copy the script to the container
COPY ./conf/services-startup.sh /usr/local/bin/services-startup.sh

# Make sure the script is executable
RUN chmod +x /usr/local/bin/services-startup.sh

# Option 2: Run the script when the container starts
CMD ["/usr/local/bin/services-startup.sh"]
