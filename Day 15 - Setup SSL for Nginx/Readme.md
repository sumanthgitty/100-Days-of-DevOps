### Question: 

The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. They have some pre-requites to get ready that server for application deployment. Prepare the server as per requirements shared below:
- Install and configure Nginx.
- Move the self-signed SSL certificate and key from /tmp/nautilus.crt and /tmp/nautilus.key to proper locations and configure in Nginx.
- Create index.html with content Welcome! in the Nginx document root.
- Test HTTPS access from jump host using curl -Ik https://<app-server-ip>/.

### Solution:

#### 1. Create directories for SSL certificate and key
```sh
sudo mkdir -p /etc/nginx/certs /etc/nginx/private
```
#### 2. Move the certificate and key to appropriate locations
```sh
sudo mv /tmp/nautilus.crt /etc/nginx/certs/
sudo mv /tmp/nautilus.key /etc/nginx/private/
```
#### 4. Set proper permissions
```sh
sudo chmod 644 /etc/nginx/certs/nautilus.crt
sudo chmod 600 /etc/nginx/private/nautilus.key
```
#### 5. Update Nginx configuration

Edit `/etc/nginx/nginx.conf` to configure SSL:
```sh
server {
    listen       443 ssl http2;
    listen       [::]:443 ssl http2;

    server_name  _;

    root         /usr/share/nginx/html;

    ssl_certificate "/etc/nginx/certs/nautilus.crt";
    ssl_certificate_key "/etc/nginx/private/nautilus.key";

    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  10m;
    ssl_ciphers PROFILE=SYSTEM;
    ssl_prefer_server_ciphers on;
}
```
Verify Nginx configuration:
```sh
sudo nginx -t
```
Expected output: syntax is ok and test is successful.
#### 6. Create test webpage
```sh
echo "Welcome!" | sudo tee /usr/share/nginx/html/index.html
```
#### 7. Enable and start Nginx
```sh
sudo systemctl enable nginx
sudo systemctl start nginx
```

#### 8. Test the website from jump host
```sh
curl -k https://<App-Server-3-IP>/
```
Expected output: `Welcome!`