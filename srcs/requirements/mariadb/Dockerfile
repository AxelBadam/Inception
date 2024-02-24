FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./mariadb.sh /

RUN chmod +x /mariadb.sh

CMD ["/mariadb.sh"]