### Question:
Install SELinux packages and disable SELinux (permanently) until the next reboot.

### Solution:
```sh
# Install SELinux packages
sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils  

# Edit config
sudo vi /etc/selinux/config
```

Set:
```ini
SELINUX=disabled
```