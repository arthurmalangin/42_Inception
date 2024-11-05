FROM debian:bullseye

ARG FTP_USER
ARG FTP_PASSWORD

ENV FTP_USER=${FTP_USER}
ENV FTP_PASSWORD=${FTP_PASSWORD}

RUN apt-get update && \
    apt-get install -y vsftpd

# si on le fait pas erreur -> 500 OOPS: vsftpd: not found: directory given in 'secure_chroot_dir':/var/run/vsftpd/empty
RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

#move dans ./tools/setup.sh
#RUN useradd -m "$FTP_USER" && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

COPY ./tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

#21000-21010 pour les ports passifs pour le get d'info
EXPOSE 21 21000-21010

ENTRYPOINT ["/usr/local/bin/setup.sh"]
#CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
