### Question: Install and Configure Nginx as an LBR

- Install Nginx on the LBR (load balancer) server.
- Configure HTTP load-balancing in /etc/nginx/nginx.conf using all App Servers.
- Ensure Apache is running on its configured port on all App Servers; do not change Apache ports.
- After configuration, verify the website using the StaticApp button.

### Solution: 

#### 1. Checked App Servers

Verified the Apache (httpd) service port on all app servers → `8082` in my case.

Ensured httpd is enabled and running on all app servers.

#### 2. Installed Nginx on LBR server
```sh
sudo yum install nginx -y   # or apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
```

#### 3. Configured Load Balancing

Open main Nginx config `/etc/nginx/nginx.conf`.

- Add upstream block inside http {}:
```sh
upstream backend {
    server 172.16.238.10:8082;
    server 172.16.238.11:8082;
    server 172.16.238.12:8082;
}
```
- Update server {} block to proxy requests:
```sh
server {
    listen 80;
    listen [::]:80;
    server_name _;
    root /usr/share/nginx/html;

    include /etc/nginx/default.d/*.conf;

    location / {
        proxy_pass http://backend;
    }
}
```

#### 4. Test and Start Nginx
```sh
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl status nginx
```

#### 5. Result

LBR is now forwarding traffic to all app servers on Apache port 8082.

Verified access via StaticApp or curl `http://<lbr-ip>/`