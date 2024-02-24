# Use a base image with PHP-FPM
FROM debian:bullseye

# Install PHP and PHP-FPM
RUN apt-get update && apt-get install -y php-fpm php-mysql wget unzip && \
    rm -rf /var/lib/apt/lists/* 

# Configure PHP-FPM
# Note: Adjustments to the PHP-FPM configuration might be necessary depending on your setup
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf && \
    sed -i 's/;listen.allowed_clients = 127.0.0.1/listen.allowed_clients = any/' /etc/php/7.4/fpm/pool.d/www.conf

# Download and extract WordPress
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip && \
    chown -R www-data:www-data /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.4", "-F"]
