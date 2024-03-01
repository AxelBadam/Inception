FROM debian:bullseye

RUN addgroup --system nginx && \
    adduser --system --ingroup nginx --no-create-home --disabled-login nginx


RUN apt-get update && apt-get install -y \
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

EXPOSE 9000


ENTRYPOINT ["sh", "/wp.sh"]