#!/bin/bash

sleep 10

if [ ! -f "/var/www/html/wp-config.php" ]
then
	wp core download --path="/var/www/html" --allow-root
	wp config create --path="/var/www/html" --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --skip-check
	wp core install --path="/var/www/html" --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email
	wp user create --path="/var/www/html" --allow-root $WP_USER $WP_EMAIL --user_pass=$WP_PASS --role='contributor'
else
	echo "nopp"

fi


#exec finale voir Dockerfile pour plus de details
exec /usr/sbin/php-fpm7.4 -F
