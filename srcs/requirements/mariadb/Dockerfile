FROM debian:buster

RUN apt-get update -y \
&& apt-get install mariadb-server -y \
&& apt-get install bash

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb.sh /

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld \
&& chown -R mysql:mysql /var/lib/mysql

RUN chmod +x /mariadb.sh

EXPOSE 3306

ENTRYPOINT ["/mariadb.sh"]