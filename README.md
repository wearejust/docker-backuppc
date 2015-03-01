# Summary
* BackupPC based on Ubuntu 14.04
* Support for sending status mail via docker host

# How to use
* change  the relayhost for postfix in Dockerfile line 13
* cd into the directory
* run ```docker build```
* run the image ```docker -d -P -v /<your-backup-folder>:/var/lib/backuppc <image-id>```