#!/bin/bash

attempts=0
while ! mariadb -h"$MYSQL_HOST" -u"$WP_DB_USER" -p"$WP_DB_PWD" "$WP_DB_NAME" > /dev/null 2>&1; do
    attempts=$((attempts + 1))
    echo "MariaDB unavailable. Attempt $attempts: Trying again in 5 sec."
    if [ $attempts -ge 12 ]; then
        echo "Max attempts reached. MariaDB connection could not be established."
        exit 1
    fi
    sleep 5
done
echo "MariaDB connection established!"

sleep 10

echo "Listing databases:"
mariadb -h$MYSQL_HOST -u$WP_DB_USER -p$WP_DB_PWD $WP_DB_NAME <<EOF
SHOW DATABASES;
EOF

cd /var/www/wordpress/

# Download WP cli
wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp

# Make it executable
chmod +x /usr/local/bin/wp

# DL WP using the CLI
wp core download --allow-root

# Create WP database config
wp config create --allow-root\
	--dbname=$WP_DB_NAME \
	--dbuser=$WP_DB_USER \
	--dbpass=$WP_DB_PWD \
	--dbhost=$MYSQL_HOST \
	--path=/var/www/wordpress/ \
	--force

# Install WP and feed db config
wp core install \
	--url=$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PWD \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root \
	--skip-email \
	--path=/var/www/wordpress/

# Create WP user
wp user create \
	$WP_USER \
	$WP_EMAIL \
	--role=author \
	--user_pass=$WP_PWD \
	--allow-root

# Install theme for WP
wp theme install inspiro \
	--activate \
	--allow-root

# Update plugins
wp plugin update --all --allow-root

# Update WP address and site address to match our domain
wp option update siteurl "https://$DOMAIN_NAME" --allow-root
wp option update home "https://$DOMAIN_NAME" --allow-root

# Transfer ownership to the user
chown -R nginx:nginx /var/www/wordpress

# Full permissions for owner, read/exec to others
chmod -R 755 /var/www/wordpress

# Fire up PHP-FPM (-F to keep in foreground and avoid recalling script)
/usr/sbin/php-fpm7.4 -F