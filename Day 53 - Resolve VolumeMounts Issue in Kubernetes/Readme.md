### Task - 

We encountered an issue with our Nginx and PHP-FPM setup on the Kubernetes cluster this morning, which halted its functionality. Investigate and rectify the issue:
- The pod name is nginx-phpfpm and configmap name is nginx-config. Identify and fix the problem.
- Once resolved, copy `/home/thor/index.php` file from the jump host to the `nginx-container` within the nginx document root. 

After this, you should be able to access the website using Website button on the top bar.

### Solution - 

#### Problem:
The nginx + PHP-FPM pod is broken because the shared volume is mounted to the wrong paths in each container:
- PHP-FPM expects files in: /var/www/html
- NGINX expects files in: /usr/share/nginx/html

Both containers must mount the shared volume to the same directory for NGINX to serve the PHP files correctly.

#### Commands:
```sh
kubectl edit pod nginx-phpfpm 

# and change the mountPath to /var/www/html to both container 

kubectl cp /home/thor/index.php nginx-phpfpm:/var/www/html/index.php -c nginx-container
```


