### Question:
Install Ansible version 4.10.0 on the Jump Host using pip3 only. Ensure that the Ansible binary is available globally, so all users on the system can run Ansible commands.

### Solution (Steps):
```sh
# Update system packages (optional but recommended):

sudo apt update          # Debian/Ubuntu
sudo yum update -y       # RHEL/CentOS

# Ensure Python3 and pip3 are installed:

python3 --version
pip3 --version

# Install Ansible globally for all users:

sudo python3 -m pip install ansible==4.10.0
```

Using sudo ensures the binary is installed system-wide and accessible to all users.
Avoid --user as it only installs for the current user.

Verify Ansible installation and version:
```sh
ansible --version
```