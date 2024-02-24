#!/bin/bash

# Initialize MariaDB data directory
mysql_install_db > /dev/null 2>&1

# Start mysqld in the background
mysqld_safe &

# Wait a bit for mysqld to start
sleep 10

# Perform database initialization commands
echo "CREATE DATABASE IF NOT EXISTS $db1_name;" | mysql
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd';" | mysql
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%';" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

# Now, instead of killing mysqld, let it continue running in the foreground
# This might not be necessary as `mysqld_safe &` already starts the server
wait


#docker run -d -p 3306:3306 --env-file ../.env --name testdb mariadb