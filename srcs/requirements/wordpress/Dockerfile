FROM debian:bullseye

# Update package list, upgrade installed packages, and install necessary packages
RUN apt update && apt upgrade -y && \
    apt install -y php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip wget && \
    # Create necessary directories
    mkdir -p /var/www/html/ && \
    mkdir -p /run/php && \
    # Download and extract WordPress
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress /var/www/html/ && \
    chmod 755 /var/www/html/wordpress && \
    chown -R www-data:www-data /var/www/html/wordpress && \
    # Change listen directive to use TCP
    sed -i 's|^listen = .*$|listen = 80|' /etc/php/7.4/fpm/pool.d/www.conf

# Set the working directory
WORKDIR /var/www/html/wordpress

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start PHP-FPM process in the foreground with the correct path
CMD ["php-fpm7.4", "-F"]


