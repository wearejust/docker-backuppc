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

exec /usr/local/bin/supervisord -c /etc/supervisord.conf

