#!/bin/bash

if [ ! -e /firstrun ]
then
	mkdir /var/lib/backuppc/cpool
	mkdir /var/lib/backuppc/pc
	chown backuppc:backuppc /var/lib/backuppc -R

	echo 1 > /firstrun
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

exec /usr/local/bin/supervisord -c /etc/supervisord.conf

