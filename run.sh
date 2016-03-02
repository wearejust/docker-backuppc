#!/bin/bash

if [ ! -e /firstrun ]
then
	mkdir /var/lib/backuppc/cpool
	mkdir /var/lib/backuppc/pc
	chown backuppc:backuppc /var/lib/backuppc -R

	echo 1 > /firstrun
fi

# Ensure that the mail host is configured properly from the
# environment variables.  Do this each time to allow mail
# configuration to change by simply recreating the container.

sed -e "s/MAILHOST/$MAILHOST/g" -e "s/FROM/$FROM/g" /var/lib/backuppc/.msmtprc.dist > /var/lib/backuppc/.msmtprc

exec /usr/local/bin/supervisord -c /etc/supervisord.conf

