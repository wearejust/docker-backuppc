# Summary
* BackupPC based on Ubuntu 14.04
* Support for sending status Mail via an external SMTP server

# How to use
* cd into  the directory
* run ```docker build```
* run the image ```docker -d -P -v /<your-backup-folder>:/var/lib/backuppc <image-id>```