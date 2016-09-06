#!/bin/bash

if [ ! -e /firstrun ]
then
	mkdir /var/lib/backuppc/cpool
	mkdir /var/lib/backuppc/pc
	chown backuppc:backuppc /var/lib/backuppc -R

	echo 1 > /firstrun
fi

# If there is no config (for example, because this volume is newly
# mapped on the host), create the default configuration

if [ ! -e /etc/backuppc/config.pl ] ; then
    tar -f /root/etc-backuppc.tgz -xC /etc/backuppc
fi

# Ensure that an SSH key exists
if [ ! -e /var/lib/backuppc/.ssh/id_rsa ] ; then
    mkdir /var/lib/backuppc/.ssh
    ssh-keygen -f /var/lib/backuppc/.ssh/id_rsa -C "BackupPC Backup Key"
    cp /etc/backuppc-ssh-config /var/lib/backuppc/.ssh/config
    chown -R backuppc:backuppc /var/lib/backuppc/.ssh
    echo 
    echo ======================================================================
    echo 
    echo "Use this SSH Key for backup:"
    echo 
    cat /var/lib/backuppc/.ssh/id_rsa.pub
    echo
    echo ======================================================================
    echo 
fi

sed -e "s/MAILHOST/$MAILHOST/g" -e "s/FROM/$FROM/g" /var/lib/backuppc/.msmtprc.dist > /var/lib/backuppc/.msmtprc

exec /usr/local/bin/supervisord -c /etc/supervisord.conf

ln -sf /usr/local/just/apache/vhost.conf /etc/apache2/sites-enabled/vhost.conf
/etc/init.d/apache2 restart