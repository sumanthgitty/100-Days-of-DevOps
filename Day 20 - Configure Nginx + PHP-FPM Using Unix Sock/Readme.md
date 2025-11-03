### Task: Configure NGINX + PHP-FPM on App Server 2

The Nautilus application development team plans to deploy a new PHP-based application on the Nautilus infrastructure in Stratos DC.
You were asked to set up NGINX and PHP-FPM on App Server 2 with the following requirements:

Requirements
- Install NGINX on App Server 2 and configure it to:
Listen on port `8092`
- Use document root /var/www/html
- Install PHP-FPM 8.1
- It must use the Unix socket /var/run/php-fpm/default.sock
(create the parent directory if it doesn’t exist)
- Configure NGINX and PHP-FPM to work together
- Verify setup using:
`curl http://stapp02:8092/index.php`

Note: Files index.php and info.php were already present under /var/www/html.

### Solution:

#### 1. Install Required Packages:
```sh
sudo dnf install -y epel-release
sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm
sudo dnf module enable php:remi-8.1 -y
sudo dnf install -y nginx php php-fpm php-cli php-common php-mysqlnd php-pdo
```
#### 2. Configure PHP-FPM Socket:
Edit the pool configuration:
```sh
sudo vi /etc/php-fpm.d/www.conf
```
Change the following lines:
```sh
listen = /var/run/php-fpm/default.sock
listen.owner = nginx
listen.group = nginx
listen.mode = 0660
```

#### 3. Then create the socket directory:
```sh
sudo mkdir -p /var/run/php-fpm
sudo chown nginx:nginx /var/run/php-fpm
```

#### 4. Restart PHP-FPM:
```sh
sudo systemctl enable php-fpm
sudo systemctl restart php-fpm
```
#### 5. Configure NGINX:
Edit the NGINX configuration file:
```sh
sudo vi /etc/nginx/nginx.conf
```

Under the existing server { ... } block, set:
```sh
server {
    listen 8092;
    server_name localhost;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass unix:/var/run/php-fpm/default.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

#### 6. Start NGINX and Verify:
```sh
sudo systemctl enable nginx
sudo systemctl restart nginx
```

#### 7. Test:
Test from the same server:
```sh
curl http://localhost:8092/index.php
curl http://localhost:8092/info.php
```