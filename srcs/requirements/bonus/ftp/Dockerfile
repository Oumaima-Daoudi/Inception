FROM debian:bullseye

RUN apt-get update && \
    apt-get -y install proftpd

# Copy the FTP setup script into the container
COPY ./conf/setup-ftp.sh /usr/local/bin/setup-ftp.sh

RUN chmod +x /usr/local/bin/setup-ftp.sh

# Copy ProFTPD configuration file
COPY ./conf/proftpd.conf /etc/proftpd/proftpd.conf

# Run the setup script on container startup
CMD ["/usr/local/bin/setup-ftp.sh"]