#!/bin/sh

useradd -m "$FTP_USER" && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

exec /usr/sbin/vsftpd /etc/vsftpd.conf