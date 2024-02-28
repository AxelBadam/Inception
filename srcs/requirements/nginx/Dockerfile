FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FI/ST=Helsinki/L=Helsinki/O=42 School/OU=atuliara/CN=atuliara/"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
