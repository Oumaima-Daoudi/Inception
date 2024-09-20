FROM debian:bullseye

# Install MariaDB server and MariaDB client
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

COPY ./conf/init-mysql.sh /

RUN chmod +x ./init-mysql.sh

CMD ["sh", "./init-mysql.sh"]