### Question:
Create a user with a non-interactive shell in Linux.

### Solution:
```sh
# Create user with nologin shell
sudo useradd -m -s /usr/sbin/nologin kareem  

# (Optional) Set password if needed
sudo passwd kareem  

# Delete user if required
sudo userdel -r kareem
```