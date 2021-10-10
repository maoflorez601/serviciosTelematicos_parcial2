yum install bind-utils bind-libs bind-* vim net-tools openssl vsftpd -y
systemctl enable named
service named start
chkconfig vsftpd on
service vsftpd start