#!/bin/bash

set -e

# Install required tool
yum install -y wget

# Import Jenkins GPG key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Add Jenkins repository
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Install Java (required for Jenkins)
yum install -y fontconfig java-11-openjdk

# Install Jenkins
yum install -y jenkins

# Reload systemd
systemctl daemon-reload

# Start and enable Jenkins
systemctl start jenkins
systemctl enable jenkins
