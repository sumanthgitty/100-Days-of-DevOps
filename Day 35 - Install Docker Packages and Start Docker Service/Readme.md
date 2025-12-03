### Task - Docker

The Nautilus DevOps team aims to containerize various applications following a recent meeting with the application development team. They intend to conduct testing with the following steps:
- Install docker-ce and docker compose packages on App Server 3.
- Initiate the docker service.

### Solution - 
```sh
ssh banner@stapp03
vi script.sh
chmod +x script.sh
./script.sh
```

Add the following content:
- [script.sh](./script.sh)
