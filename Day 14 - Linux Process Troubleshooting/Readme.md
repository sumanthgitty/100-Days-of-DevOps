### Question: Linux Process Troubleshooting

The monitoring system reported that the Apache (httpd) service was down on one or more app servers in the Stratos DC.
The goal was to identify the faulty host, ensure the service is up, and confirm it runs on port 3000 on all app servers.

### Solution
#### 1. Checked Apache service status on all app servers:
```sh
sudo systemctl status httpd
```
#### 2. Identified faulty servers where httpd was inactive or failed.

Verified if port 3000 was already in use:
```sh
sudo netstat -tulnp | grep 3000
```

#### 3. In some servers, another service was using port 3000.

Stopped conflicting service:
```sh
sudo systemctl stop <service-name>
```

#### 4. Started and enabled Apache (httpd):
```sh
sudo systemctl start httpd
sudo systemctl enable httpd
```

#### 5. Verified Apache is running and listening on port 3000:
```sh
sudo netstat -tulnp | grep httpd
```

`(Optional)` Confirmed configuration file `(/etc/httpd/conf/httpd.conf)` has:

`Listen 3000`

#### 6. To very from jump host run:
```sh
curl http://stapp01:3000
curl http://stapp02:3000
curl http://stapp03:3000
```
