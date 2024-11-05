FROM debian:bullseye

RUN apt-get update && apt-get install wget php php-fpm php-mysql curl -y

RUN mkdir -p /var/www/html

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php && \
    mv adminer-4.8.1-mysql.php /var/www/html/index.php

#edit de www.conf pour dire a fpm d'ecouter le port 8010, (par default listen = /run/php/php7.4-fpm.sock)
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php 

#ouvrir le port 8011
EXPOSE 8011

#la 7.4 car la plus stable 
CMD ["/usr/sbin/php-fpm7.4", "-F"]
#-F pour --nodaemonize pour que l'exec reste en premier plan 
# et pas en mode "deamon"/arriere plan car sinon docker le stope car il pense que le container n'a plus rien a faire 