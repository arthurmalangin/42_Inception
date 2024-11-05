FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd

# si on le fait pas erreur -> 500 OOPS: vsftpd: not found: directory given in 'secure_chroot_dir':/var/run/vsftpd/empty
RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN useradd -m ftpuser && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

#21000-21010 pour les ports passifs pour le get d'info
EXPOSE 21 21000-21010

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
