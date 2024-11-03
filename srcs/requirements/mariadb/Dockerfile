FROM debian:bullseye

RUN apt-get update && apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld"]