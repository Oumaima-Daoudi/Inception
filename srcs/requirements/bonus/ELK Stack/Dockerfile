FROM debian:bullseye

RUN apt-get update && apt-get -y install openjdk-11-jdk wget procps

RUN apt-get -y install gnupg2 && \
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN apt-get install apt-transport-https && \
    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list

RUN apt-get update && apt-get install -y elasticsearch logstash kibana 

COPY ./conf/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

COPY ./conf/kibana.yml /etc/kibana/kibana.yml

COPY ./conf/30-elasticsearch-output.conf /etc/logstash/conf.d/30-elasticsearch-output.conf

# Install service management package (systemctl isn't natively supported in containers)
RUN apt-get install -y sysvinit-utils

# Copy the script to the container
COPY ./conf/services-startup.sh /usr/local/bin/services-startup.sh

# Make sure the script is executable
RUN chmod +x /usr/local/bin/services-startup.sh

# Option 2: Run the script when the container starts
CMD ["/usr/local/bin/services-startup.sh"]
