#!/bin/bash

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

service mysql start
mysql -u root -h localhost -e \
"CREATE DATABASE IF NOT EXISTS \`${WP_DB_NAME}\`; \
CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PWD}'; \
GRANT ALL PRIVILEGES ON \`${WP_DB_NAME}\`.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PWD}' WITH GRANT OPTION;\
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PWD}'; \
FLUSH PRIVILEGES;"

echo "MariaDB has been installed and configured. Restarting..."
kill $(cat /var/run/mysqld/mysqld.pid)
exec mysqld_safe
