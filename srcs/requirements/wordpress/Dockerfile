FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.3 \
php-fpm \ 
php-mysql \ 
mariadb-client \
wget \
bash \
&& rm -rf /var/lib/apt/lists/*
						
# RUN	chown -R www-data:www-data /var/www/wordpress

RUN mkdir -p /run/php/ /var/www/wordpress
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wp.sh /
RUN chmod +x wp.sh

ENTRYPOINT ["sh", "/wp.sh"]