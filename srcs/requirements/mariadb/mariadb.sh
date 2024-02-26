#!/bin/bash

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$db1_pwd';
CREATE DATABASE $db_name;
CREATE USER '$WP_ADMIN_USR'@'%' IDENTIFIED by '$WP_PWD';
GRANT ALL PRIVILEGES ON $db_name.* TO '$WP_ADMIN_USR'@'%';
GRANT ALL PRIVILEGES ON *.* TO '$WP_ADMIN_USR'@'%' IDENTIFIED BY '$WP_PWD' WITH GRANT OPTION;
GRANT SELECT ON mysql.* TO '$WP_ADMIN_USR'@'%';
FLUSH PRIVILEGES;
EOF

exec mysqld