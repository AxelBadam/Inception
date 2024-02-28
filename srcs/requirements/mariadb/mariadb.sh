#!/bin/bash

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$db1_pwd';
CREATE DATABASE $WP_DB_NAME;
CREATE USER '$WP_DB_USER'@'%' IDENTIFIED by '$WP_DB_PWD';
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%';
GRANT ALL PRIVILEGES ON *.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PWD' WITH GRANT OPTION;
GRANT SELECT ON mysql.* TO '$WP_DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

exec mysqld --defaults-file=/etc/mysql/mariadb.conf.d/50-server.cnf


#mby run this script separately, the mariadb cannot be connected 