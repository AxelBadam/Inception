#!/bin/bash

# Initialize the database directory
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql

mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PWD}';
CREATE DATABASE ${WP_DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED by '${WP_DB_PWD}';
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

mysqld_safe

