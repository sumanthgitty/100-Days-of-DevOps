### Task - Docker EXEC Operations

On App Server 1, inside the `kkloud` container:
- Install `apache2` using apt.
- Configure Apache to listen on port `6400` (not bound to any specific IP).
- Ensure Apache is `running`, and keep the container `running`.

### Solution - 
```sh
docker ps

docker exec -it kkloud /bin/bash
apt install apache2 vim net-tools -y

vi /etc/apache2/ports.conf                             # Chnange Listen 80 to Listen 6400
vi /etc/apache2/sites-available/000-default.conf       # Change <VirtualHost *:80> to <VirtualHost *:6400>

service apache2 restart
service apache2 status
netstat -tulnp | grep 6400                             # Make sure apache is running on port 6400
curl -I http://localhost:6400
exit

docker ps
``` 
