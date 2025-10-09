### Question: Linux Network Services

Our monitoring tool has reported an issue in Stratos Datacenter. One of our app servers has an issue, as its Apache service is not reachable on port 5003 (which is the Apache port). The service itself could be down, the firewall could be at fault, or something else could be causing the issue.

Use tools like telnet, netstat, etc. to find and fix the issue. Also make sure Apache is reachable from the jump host without compromising any security settings.

Once fixed, you can test the same using command curl http://stapp01:5003 command from jump host.

### Solution: 

#### 1. Check which process is using the port
```sh
sudo netstat -tunlp | grep 5003
```
Found sendmail occupying port 5003.

#### 2. Stop the conflicting service
```sh
sudo systemctl stop sendmail
```
#### 3. Start Apache
```sh
sudo systemctl start httpd
```
#### 4. Check firewall rules
```sh
sudo iptables -L -n
```
Confirmed that port 5003 was blocked (not listed as ACCEPT in INPUT chain).

#### 5. Allow Apache port 5003
```sh
sudo iptables -I INPUT -p tcp --dport 5003 -j ACCEPT
```

#### 6. Verify rules
```sh
sudo iptables -L -n | grep 5003
```

#### 7.Test Apache connectivity from jump host
```sh
curl http://stapp01:5003
```

