### Question:
Set up password-less authentication from user thor on the jump host to all app servers in Stratos Datacenter through their respective sudo users.


### Solution:
1. Create a script file
```sh
vi script.sh
```
Add the following content to the script (# The script generates an SSH key if not already present using the following command `ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa`)

- [script.sh](./script.sh)

2. Make the script executable
```sh
chmod +x script.sh
```

3. Run the script
```sh
./script.sh
```
It will prompt for each server’s password once.

4. After that, thor can SSH to all servers without a password.

Verify passwordless login
```sh
ssh tony@stapp01
ssh steve@stapp02
ssh banner@stapp03
```