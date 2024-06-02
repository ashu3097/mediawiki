#!/bin/bash

# Start MariaDB service
/usr/bin/mysqld_safe &

# Start httpd service
/usr/sbin/httpd -DFOREGROUND &

# Wait for MariaDB to start
sleep 10

# Run the rest of the commands passed to the container
exec "$@"
