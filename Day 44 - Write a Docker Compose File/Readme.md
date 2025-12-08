### Tsk - Docker Compose 

Create `/opt/docker/docker-compose.yml` on `App Server 1` that:
- Runs a container named `httpd` using the `latest httpd` image.
- Maps host port `5000` container port `80`.
- Mounts host directory `/opt/finance`  `/usr/local/apache2/htdocs` in the container.

### Solution - 
```sh
sudo vi /opt/docker/docker-compose.yml

# Add the following:

version: '3.8'
services:
  httpd:
    container_name: httpd
    image: httpd:latest
    ports:
      - "5000:80"
    volumes:
      - /opt/finance:/usr/local/apache2/htdocs

docker compose -f /opt/docker/docker-compose.yml up -d
docker ps
```

- [docker-compose.yml](./docker-compose.yml)