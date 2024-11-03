FROM debian:bullseye

RUN apt-get update && apt-get install php php-fpm -y

#edit de www.conf pour dire a fpm d'ecouter le port 8010, (par default listen = /run/php/php7.4-fpm.sock)
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php

EXPOSE 8010

#la 7.4 car la plus stable 
CMD ["/usr/sbin/php-fpm7.4", "-F"]
#-F pour --nodaemonize pour que l'exec reste en premier plan 
# et pas en mode "deamon"/arriere plan car sinon docker le stope car il pense que le container n'a plus rien a faire 