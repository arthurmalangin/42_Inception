#!/bin/bash

#on demarre le service mariadb
mysqld_safe &

sleep 3

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO \`$MYSQL_USER\`@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

#la doc de mariadb conseil partout de le lancer en safe
exec mysqld_safe