FROM debian:bullseye

# Install MariaDB server and MariaDB client
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    # Create the directory for MariaDB runtime files
    mkdir -p /run/mysqld && \
    # Set proper permissions
    chown -R mysql:mysql /run/mysqld && \
    chmod 777 /run/mysqld

# Copy the SQL script to set the root password
COPY ./conf/init.sql /docker-entrypoint-initdb.d/


EXPOSE 3306

CMD ["mysqld"]