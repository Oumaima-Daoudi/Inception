#!/bin/bash

# Set up WordPress
if [ ! -f /wordpress/wp-config.php ]; then
    echo "No wp-config.php found, exiting"
    exit 1
fi

# # Wait for the database to be ready
# echo "Waiting for MariaDB to be ready..."
# until wp db check --path=/wordpress --allow-root; do
#     echo "Waiting for the database..."
#     sleep 3
# done

sleep 3

# Check if WordPress is already installed
if ! wp core is-installed --path=/wordpress --allow-root; then
    echo "Installing WordPress..."

    # Install WordPress
    wp core install --path=/wordpress --url="https://localhost" --title="docker-project" --admin_user="${WORDPRESS_DB_USER}" --admin_password="${WORDPRESS_DB_PASSWORD}" --admin_email="oumaimadaoudi13@gmail.com" --skip-email --allow-root

    # Create additional users
    wp user create ziad daoudioumaima@gmail.com --role=subscriber --user_pass="ziad1234" --path=/wordpress --allow-root


    echo "WordPress installed successfully."
else
    echo "WordPress is already installed."
fi

# Install and activate Redis Object Cache plugin
wp plugin install redis-cache --activate --path=/wordpress --allow-root

# Enable Redis cache
wp redis enable --path=/wordpress --allow-root

# Make sure PHP-FPM is started
php-fpm7.4 -F
