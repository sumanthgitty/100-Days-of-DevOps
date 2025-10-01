#!/bin/bash

# 1.Generate ssh key  if not exists
if [ ! -f ~/.ssh/id_rsa.pub  ]; then
    echo "ssh key creating.."
    ssh-keygen -t rsa -f "$HOME/.ssh/id_rsa" -N ""
else
    echo "ssh key already exists, skipping generation"
fi

# 2.List of servers
servers=("tony@stapp01" "steve@stapp02" "banner@stapp03")

# 3.Loop through servers and copy key 
for server in "${servers[@]}"; do
    echo "copying ssh key to $server"
    ssh-copy-id -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa.pub "$server"
done

echo "Passwordless ssh setup completed"