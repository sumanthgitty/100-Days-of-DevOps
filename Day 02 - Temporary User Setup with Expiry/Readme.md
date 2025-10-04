### Question:
Create a user named ravi on App Server 2 with expiry date 2023-12-07.

### Solution:
```sh
# Create user with expiry
sudo useradd -m -e 2023-12-07 ravi  

# Set password
sudo passwd ravi
```