service mariadb start


sleep 1

    mariadb -e "CREATE DATABASE IF NOT EXISTS oumi;"
    mariadb -e "CREATE USER 'rida' IDENTIFIED BY 'oumi';"
    mariadb -e "GRANT ALL PRIVILEGES ON oumi.* to 'rida'@'%';"
    mariadb -e "FLUSH PRIVILEGES;"
    mysqladmin -u root shutdown
    mysqld_safe --bind-address=0.0.0.0