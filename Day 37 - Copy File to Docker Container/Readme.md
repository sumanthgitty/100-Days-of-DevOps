### Task - Copy File to Docker Container

The Nautilus DevOps team possesses confidential data on App Server 2 in the Stratos Datacenter. A container named ubuntu_latest is running on the same server.
- Copy an encrypted file `/tmp/nautilus.txt.gpg` from the docker host to the `ubuntu_latest` container located at `/tmp/`. Ensure the file is not modified during this operation.

### Solution - 
```sh
docker ps 
docker cp /tmp/nautilus.txt ubuntu_latest:/tmp/
docker exec ubuntu_latest ls /tmp/
```
