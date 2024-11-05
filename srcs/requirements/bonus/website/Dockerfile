FROM debian:bullseye

RUN apt-get update && apt-get install nginx netcat netcat-openbsd openssl -y
RUN mkdir -p /run/nginx
RUN mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN chmod -R 755 /etc/nginx /var/www/html
#creer lui meme le certificat pour le ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=FR/ST=NouvelleAquitaine/L=Angouleme/O=42/OU=Inception/CN=amalangi.42.fr" \
    -keyout /etc/nginx/ssl/cert.key -out /etc/nginx/ssl/cert.crt

EXPOSE 444

COPY ./conf/index.html /var/www/html/index.html
COPY ./conf/style.css /var/www/html/style.css

CMD ["nginx", "-g", "daemon off;"]