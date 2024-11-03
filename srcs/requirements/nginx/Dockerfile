FROM debian:buster

RUN apt-get update && apt-get install nginx openssl -y
RUN mkdir -p /run/nginx
RUN mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN chmod -R 755 /etc/nginx /var/www/html
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=FR/ST=NouvelleAquitaine/L=Angouleme/O=42/OU=Inception/CN=arthurmanalangin.42.fr" \
    -keyout /etc/nginx/ssl/cert.key -out /etc/nginx/ssl/cert.crt


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]