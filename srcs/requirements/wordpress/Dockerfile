FROM debian:bullseye

RUN apt-get update && apt-get install php php-fpm php-mysql curl -y

#dl wordpress cli : https://wp-cli.org/fr/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

#edit de www.conf pour dire a fpm d'ecouter le port 8010, (par default listen = /run/php/php7.4-fpm.sock)
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php

EXPOSE 8010

COPY ./tools/wp_cli_install.sh /usr/local/bin/wp_cli_install.sh
RUN chmod +x /usr/local/bin/wp_cli_install.sh

#on va utiliser un Entrypoint pour executer plus de commande en plus de fpm
ENTRYPOINT ["/usr/local/bin/wp_cli_install.sh"]


#Partie executer dans wp_cli_install.sh maintenant
#la 7.4 car la plus stable 
#CMD ["/usr/sbin/php-fpm7.4", "-F"]
#-F pour --nodaemonize pour que l'exec reste en premier plan 
# et pas en mode "deamon"/arriere plan car sinon docker le stope car il pense que le container n'a plus rien a faire 