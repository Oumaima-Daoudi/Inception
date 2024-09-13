FROM debian:bullseye

RUN apt-get update && \
    apt-get -y install wget && \
    apt-get install php php-mysql php-mbstring php-xml php-curl -y && \
    apt-get install -y apache2 libapache2-mod-php

# Copy the setup script for Apache and PHP to the container
COPY ./conf/setup-php-apache.sh /usr/local/bin/

# Make sure the script has executable permissions
RUN chmod +x /usr/local/bin/setup-php-apache.sh

# Run the script to install and configure Apache and PHP
RUN /usr/local/bin/setup-php-apache.sh

# Remove the default Apache index.html page
RUN rm /var/www/html/index.html

# Download Adminer and place it in the web server root directory
RUN wget https://www.adminer.org/latest.php -O /var/www/html/index.php

# # Start Apache server in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]



