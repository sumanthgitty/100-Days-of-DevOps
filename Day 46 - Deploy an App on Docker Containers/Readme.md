### Task - Deploy an App on Docker Containers

Create `/opt/security/docker-compose.yml` on App Server 1 to deploy two services:

`1. Web service`
- Container name: php_apache
- Image: php:apache
- Port mapping: 6300 → 80
- Volume: /var/www/html:/var/www/html

`2. DB service`
- Container name: mysql_apache
- Image: mariadb (any tag)
- Port mapping: 3306 - 3306
- Volume: /var/lib/mysql:/var/lib/mysql
- Environment:
`MYSQL_DATABASE=database_apache`
custom non-root user + strong password

### Solution:
```sh 
sudo vi /opt/security/docker-compose.yml

# add the following:
version: '3.8'
services:
  web:
    container_name: php_apache
    image: php:apache
    ports:
      - "6300:80"
    volumes:
      - /var/www/html:/var/www/html

  DB:
    container_name: mysql_apache
    image: mariadb:latest
    ports:
      - "3306:3306"
    volumes:
      - /var/lib/mysql:/var/lib/mysql
    environment:
      - MYSQL_DATABASE=database_apache
      - MARIADB_USER=froze
      - MARIADB_PASSWORD=froze07*
      - MARIADB_ROOT_PASSWORD=RootP@ss123

# commands to run
docker compose -f /opt/security/docker-compose.yml up -d

# to verify
docker ps 

curl <server-ip>:6300/   or   curl http://localhost:6300/                     
```

- [docker-compose.yml](./docker-compose.yml)