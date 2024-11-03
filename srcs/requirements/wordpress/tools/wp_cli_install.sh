#!/bin/bash

wp core download --path="/var/www/html" --allow-root

#exec finale voir Dockerfile pour plus de details
exec /usr/sbin/php-fpm7.4 -F
