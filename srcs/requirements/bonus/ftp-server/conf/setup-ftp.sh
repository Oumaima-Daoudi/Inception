#!/bin/bash

# Add FTP user and set home directory
if ! id "ftpuser" &>/dev/null; then
    useradd -m -d /var/www/html/ftpuser -s /bin/bash ftpuser && \
    echo "ftpuser:pass" | chpasswd
fi


# Set proper permissions
chown -R ftpuser:ftpuser /var/www/html

# Start ProFTPD
/usr/sbin/proftpd --nodaemon
