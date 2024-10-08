service mariadb start
sleep 1

    mariadb -u root -pmy-secret-pass -e "CREATE DATABASE IF NOT EXISTS wordpress;"
    mariadb -u root -pmy-secret-pass -e "CREATE USER 'oumaima' IDENTIFIED BY 'ensa-1234';"
    mariadb -u root -pmy-secret-pass -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'my-secret-pass';"
    mariadb -u root -pmy-secret-pass -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'oumaima'@'%';"
    mariadb -u root -pmy-secret-pass -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -pmy-secret-pass shutdown
    mysqld_safe --bind-address=0.0.0.0