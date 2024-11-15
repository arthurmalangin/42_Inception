FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/db_init.sh /usr/local/bin/db_init.sh 
RUN chmod 755 /usr/local/bin/db_init.sh
#Fonctionne sans
#RUN mkdir -p /var/run/mysqld
#RUN chown -R mysql:mysql /run/mysqld
#RUN chmod 755 /run/mysqld


EXPOSE 3306

#CMD ["mysql"]
CMD ["/usr/local/bin/db_init.sh"]