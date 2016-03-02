# Summary
* BackupPC based on Ubuntu 14.04
* Support for sending status mail using msmtp

# How to use
* change backuppc htaccess password in Dockerfile line 19
* cd into the directory
* run ```docker build```
* run the image ```docker run -d -P -e MAILHOST=<your-mail-host> -v /<your-backup-folder>:/var/lib/backuppc <image-id>```


# Configuration

## Mail

You can use environment variables MAILHOST and FROM to set the target
mail relay host and mail "from" address, respectively.

