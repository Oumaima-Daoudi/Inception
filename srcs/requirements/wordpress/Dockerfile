FROM debian:bullseye


RUN apt update && apt upgrade -y && \
    apt install -y apache2 libapache2-mod-php php-mysql php-fpm php-redis wget curl && \
    # Create necessary directories
    mkdir -p /run/php 

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp


RUN \
    # Download and extract WordPress
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz 
RUN \
    # Change listen directive to use TCP
    sed -i 's|^listen = .*$|listen = 80|' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /wordpress/wp-config.php

# Add script for setting up WordPress automatically
COPY ./conf/install-wordpress.sh /usr/local/bin/install-wordpress.sh
RUN chmod +x /usr/local/bin/install-wordpress.sh

# Run the setup script on container startup
CMD ["sh", "/usr/local/bin/install-wordpress.sh"]


