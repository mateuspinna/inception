#!/bin/bash

if [ ! -f "/var/www/html/wp/wp-config.php" ]; then
echo "switch to /wp"

cd /var/www/html/wp


echo "Installing and starting WordPress"
        wget  --no-check-certificate -q -O - https://wordpress.org/latest.tar.gz | tar -xz -C /var/www/html/wp --strip-components=1
        chmod -R +rwx /var/www/html/wp

        wp --path=/var/www/html/wp --allow-root config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --dbhost="mariadb":"3306" --dbprefix='wp_'
        wp --path=/var/www/html/wp --allow-root core install --url="$DOMAIN_NAME" --title="$WORDPRESS_SITE_NAME" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"
        wp --path=/var/www/html/wp --allow-root user create "$WP_USER_EDITOR" "$WP_EMAIL_EDITOR" --role='editor' --user_pass="$WP_PASSWORD_EDITOr"
        wp --path=/var/www/html/wp --allow-root user create "$WP_USER" "$WP_EMAIL" --role='subscriber' --user_pass="$WP_PASSWORD"
fi

chmod -R 777 /var/www/html/wp
mkdir -p /run/php/
chown www-data:www-data /run/php/

exec php-fpm7.4 -F