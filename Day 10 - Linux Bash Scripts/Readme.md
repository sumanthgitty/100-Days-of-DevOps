### Question: Website Backup Automation

The production support team of xFusionCorp Industries is working on developing some bash scripts to automate different day-to-day tasks.
They need a script named ecommerce_backup.sh placed under /scripts on App Server 1, which should:
- Create a zip archive named xfusioncorp_ecommerce.zip of /var/www/html/ecommerce.
- Save the archive in /backup/ on App Server 1 (temporary storage, cleared weekly).
- Copy the created archive to the Nautilus Backup Server under /backup/.
- Ensure the script does not ask for passwords while copying.
- Allow the respective server user (e.g., tony) to run it without sudo.
- Note: The zip package must be installed manually before executing the script.

### Solution:

## 1. Install required package
```sh
sudo yum install -y zip   
```

## 2. Setup SSH keys for passwordless login

Generate SSH key (if not already created):
```sh
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
```
Copy the public key to the Backup Server:
```sh
ssh-copy-id -o StrictHostKeyChecking -i ~/.ssh/id_rsa.pub clint@stbkp01
```
Verify passwordless access:
```sh
ssh clint@stbkp01
```

## 3. Create the backup script
vi /scripts/ecommerce_backup.sh
```sh
#!/bin/bash

# Ensure local backup directory exists
mkdir -p /backup

# Create zip archive of ecommerce website
zip -r /backup/xfusioncorp_ecommerce.zip /var/www/html/ecommerce

# Ensure backup directory exists on remote backup server
ssh clint@stbkp01 "mkdir -p /backup"

# Copy archive to backup server
scp /backup/xfusioncorp_ecommerce.zip clint@stbkp01:/backup/
```

## 4. Make the script executable
```sh
chmod 755 /scripts/ecommerce_backup.sh
```

## 5. Run the script

/scripts/ecommerce_backup.sh

## 6. Verify backup
```sh
ls -l /backup/
ssh clint@stbkp01 "ls -l /backup/"
```