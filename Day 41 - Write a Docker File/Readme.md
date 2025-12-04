### Task - Write a Docker File

Create `/opt/docker/Dockerfile` on App Server 3 that:
- Uses `ubuntu:24.04` as the base image.
- Installs `apache2` and configures it to listen on port `5001`.

### Solution - 
```sh
sudo vi /opt/docker/Dockerfile 

# Add the following content
FROM ubuntu:24.04
RUN apt update && apt install apache2 -y && \
    sed -i 's/Listen 80/Listen 5001/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:5001>/' /etc/apache2/sites-available/000-default.conf 
EXPOSE 5001
CMD ["apache2ctl", "-D", "FOREGROUND"]

docker build -t ubuntu_new /opt/docker/
docker images

# To verify
docker run -d --name testapp -p 5001:5001 ubuntu_new
curl -I http://localhost:5001
```

- [Dockerfile](./Dockerfile)