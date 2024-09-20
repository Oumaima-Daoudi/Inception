service mariadb start
sleep 1

    mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress;"
    mariadb -e "CREATE USER 'oumaima' IDENTIFIED BY 'ensa-1234';"
    mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* to 'oumaima'@'%';"
    mariadb -e "FLUSH PRIVILEGES;"
    mysqladmin -u root shutdown
    mysqld_safe --bind-address=0.0.0.0