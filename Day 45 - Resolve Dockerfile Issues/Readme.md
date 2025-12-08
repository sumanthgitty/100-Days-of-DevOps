### Task - Resolve Dockerfile Issues

On App Server 1, fix the Dockerfile located at /opt/docker so that:
- It builds successfully without changing the base image
- Do not modify any valid configuration or data (e.g., index.html)
- Only fix the errors that prevent the image from building

### Solution

Broken Dockerfile:
```sh
FROM httpd:2.4.43 

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf.d/httpd.conf 

RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf.d/httpd.conf 
RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf.d/httpd.conf 
RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' /usr/local/apache2/conf.d/httpd.conf 

COPY certs/server.crt /usr/local/apache2/conf/server.crt 
COPY certs/server.key /usr/local/apache2/conf/server.key 
COPY html/index.html /usr/local/apache2/htdocs/
```

Corrected Dokcerfile:
- [Dockerfile](./Dockerfile)

```sh
FROM httpd:2.4.43

RUN sed -i "s/Listen 80/Listen 8080/" /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' /usr/local/apache2/conf/httpd.conf

COPY certs/server.crt /usr/local/apache2/conf/server.crt
COPY certs/server.key /usr/local/apache2/conf/server.key
COPY html/index.html /usr/local/apache2/htdocs/
```

commands:
```sh
cd /opt/docker/
docker build -t httpd .
docker images
```
