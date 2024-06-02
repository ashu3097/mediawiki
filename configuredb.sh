#!/usr/bin/env bash

# Set MySQL root password and create database
root_password="your_root_password"
wiki_db="wikidatabase"
wiki_user="wiki"
wiki_password="THISpasswordSHOULDbeCHANGED"

# Run the secure installation commands
expect <<EOF
spawn mysql_secure_installation

expect "Enter current password for root (enter for none):"
send "\r"

expect "Set root password? \[Y/n\]"
send "Y\r"

expect "New password:"
send "$root_password\r"

expect "Re-enter new password:"
send "$root_password\r"

expect "Remove anonymous users? \[Y/n\]"
send "Y\r"

expect "Disallow root login remotely? \[Y/n\]"
send "Y\r"

expect "Remove test database and access to it? \[Y/n\]"
send "Y\r"

expect "Reload privilege tables now? \[Y/n\]"
send "Y\r"

expect eof
EOF

# Create database and user, and grant privileges
mysql -u root -p"$root_password" -e "CREATE USER '$wiki_user'@'localhost' IDENTIFIED BY '$wiki_password';"
mysql -u root -p"$root_password" -e "CREATE DATABASE $wiki_db;"
mysql -u root -p"$root_password" -e "GRANT ALL PRIVILEGES ON $wiki_db.* TO '$wiki_user'@'localhost';"
mysql -u root -p"$root_password" -e "FLUSH PRIVILEGES;"

# Confirm that the database was created and display granted privileges
mysql -u root -p"$root_password" -e "SHOW DATABASES;"
mysql -u root -p"$root_password" -e "SHOW GRANTS FOR '$wiki_user'@'localhost';"

