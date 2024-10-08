FROM debian:bullseye

RUN apt update && apt upgrade -y && \
    apt install -y php-mysql php-fpm php-redis php-xml php-gd wget curl php php-common php-gmp php-intl php-mbstring php-xmlrpc php-cli php-zip && \
    # Create necessary directories
    mkdir -p /run/php 

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv wordpress/* /var/www/html/ && \
    rm -rf latest.tar.gz wordpress

RUN chmod -R 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Change listen directive to use TCP
RUN sed -i 's|^listen = .*$|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /var/www/html/wp-config.php

# Add script for setting up WordPress automatically
COPY ./conf/install-wordpress.sh /usr/local/bin/install-wordpress.sh
RUN chmod +x /usr/local/bin/install-wordpress.sh

# Run the setup script on container startup
CMD ["sh", "/usr/local/bin/install-wordpress.sh"]


