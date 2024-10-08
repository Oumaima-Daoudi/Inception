service mariadb start
sleep 1

    mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
    mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE USER '${MARIADB_USER}' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
    mariadb -u root -p${MARIADB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p${MARIADB_ROOT_PASSWORD} shutdown
    mysqld_safe --bind-address=0.0.0.0