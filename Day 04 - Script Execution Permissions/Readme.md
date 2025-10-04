### Question:
Grant executable permissions to /tmp/xfusioncorp.sh so all users can execute it.

### Solution:
```sh
# Give execute permission to all
sudo chmod a+rx /tmp/xfusioncorp.sh  

# Equivalent with numeric mode
sudo chmod 0755 /tmp/xfusioncorp.sh
```