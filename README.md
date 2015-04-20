# Summary
* BackupPC based on Ubuntu 14.04
* Support for sending status mail using msmtp

# How to use
* change the smtp host in msmtprc
# change backuppc htaccess password in Dockerfile line 19
* cd into the directory
* run ```docker build```
* run the image ```docker run -d -P -v /<your-backup-folder>:/var/lib/backuppc <image-id>```
