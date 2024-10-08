#!/bin/bash

# Set up WordPress
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "No wp-config.php found, exiting"
    exit 1
fi

sleep 5

# Check if WordPress is already installed
if ! wp core is-installed --path=/var/www/html --allow-root; then
    echo "Installing WordPress..."

    # Install WordPress
    wp core install --path=/var/www/html --url="${WP_SITEURL}" --title="${TITLE}" --admin_user="${WORDPRESS_DB_USER}" --admin_password="${WORDPRESS_DB_PASSWORD}" --admin_email="${ADMIN_EMAIL}" --skip-email --allow-root

    # Create additional users
    wp user create $(echo ${EDITOR_USER_NAME}) $(echo ${EDITOR_USER_EMAIL}) --role=editor --user_pass="${USER_PASS}" --path=/var/www/html --allow-root

    wp theme install astra --path=/var/www/html --allow-root
    wp theme activate astra --path=/var/www/html --allow-root


    echo "WordPress installed successfully."
else
    echo "WordPress is already installed."
fi

# Deactivate all plugins
wp plugin deactivate --all --path=/var/www/html --allow-root

# Install and activate Redis Object Cache plugin
wp plugin install redis-cache --activate --path=/var/www/html --allow-root

# Enable Redis cache
wp redis enable --path=/var/www/html --allow-root

# Make sure PHP-FPM is started
php-fpm7.4 -F
