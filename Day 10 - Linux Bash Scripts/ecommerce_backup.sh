#!/bin/bash

# Ensure local backup directory exists
mkdir -p /backup

# Create zip archive of ecommerce website
zip -r /backup/xfusioncorp_ecommerce.zip /var/www/html/ecommerce

# Ensure backup directory exists on remote backup server
ssh clint@stbkp01 "mkdir -p /backup"

# Copy archive to backup server
scp /backup/xfusioncorp_ecommerce.zip clint@stbkp01:/backup/