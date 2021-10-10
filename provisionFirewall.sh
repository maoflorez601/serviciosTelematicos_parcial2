service firewalld start
chkconfig firewalld on

service NetworkManager stop
chkconfig NetworkManager off

firewall-cmd --zone=dmz --add-interface=eth1 --permanent
firewall-cmd --zone=dmz --add-service=ftp --permanent
firewall-cmd --zone=dmz --add-service=dns --permanent

firewall-cmd --zone=internal --add-interface=eth2 --permanent

firewall-cmd --permanent --zone=dmz --add-masquerade
firewall-cmd --permanent --zone=internal --add-masquerade

firewall-cmd --permanent --zone=dmz --add-forward-port=port=443:proto=tcp:toport=443:toaddr=192.168.50.10
firewall-cmd --permanent --zone=dmz --add-forward-port=port=22:proto=tcp:toport=22:toaddr=192.168.50.11
firewall-cmd --permanent --zone=dmz --add-forward-port=port=53:proto=tcp:toport=53:toaddr=192.168.50.10
firewall-cmd --reload

service firewalld stop
service firewalld start
