FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.3 \
php-fpm \ 
php-mysql \ 
mariadb-client \
wget \
&& rm -rf /var/lib/apt/lists/*
						
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz \
										&& rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

