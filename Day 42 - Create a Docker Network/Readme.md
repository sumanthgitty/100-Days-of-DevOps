### Task - Create a Docker Network

The Nautilus DevOps team needs to set up several docker environments for different applications. One of the team members has been assigned a ticket where he has been asked to create some docker networks to be used later. Complete the task based on the following ticket description: 
- a. Create a docker network named as `official` on App Server 1 in Stratos DC. 
- b. Configure it to use `macvlan` drivers. 
- c. Set it to use subnet `10.10.1.0/24` and iprange `10.10.1.0/24`.

### Solution -
```sh
# Create docker network
docker network create \
    --driver=macvlan \
    --subnet=10.10.1.0/24 \
    --ip-range=10.10.1.0/24 \
    official

# Verify the network
docker network inspect official

# Optional: Run a test container to verify IP allocation
docker run -d --name test --network official alpine sleep 1000

# Check container IP
docker inspect -f '{{ .NetworkSettings.Networks.official.IPAddress }}' test
```