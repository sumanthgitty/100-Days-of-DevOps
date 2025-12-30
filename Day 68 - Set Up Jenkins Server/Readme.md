### Task - Set Up Jenkins Server

The DevOps team at xFusionCorp Industries is initiating the setup of CI/CD pipelines and has decided to utilize Jenkins as their server. Execute the task according to the provided requirements:

- Install Jenkins on the jenkins server using the yum utility only, and start its service.

- Jenkin's admin user name should be `theadmin`, password should be `Adm!n321`, full name should be `Kirsty` and email should be `kirsty@jenkins.stratos.xfusioncorp.com`.

### Solution -

```sh
# login into to jenkins server using root and password "S3curePass"

ssh root@jenkins
```

#### Add the following to .sh
- [Script](./jenkins.sh)
```sh
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

```

#### Run
```sh
chmod +x jenkins.sh
./jenkins.sh
systemctl status jenkins
```

#### Admin user creation (correct approach)
```sh
cat /var/lib/jenkins/secrets/initialAdminPassword
```

**In Jenkins UI:**
- Install suggested plugins
- Create admin user with exact values:
  - Username  -  theadmin
  - Password  -  Adm!n321
  - Full name - Kirsty
  - Email	  - kirsty@jenkins.stratos.xfusioncorp.com


