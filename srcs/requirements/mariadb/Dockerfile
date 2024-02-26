FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./mariadb.sh /

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

RUN chmod +x /mariadb.sh

CMD ["/mariadb.sh"]