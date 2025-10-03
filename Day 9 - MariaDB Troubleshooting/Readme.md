### Question: MariaDB Troubleshooting

There is a critical issue in Stratos DC. The application is unable to connect to the database because the mariadb service is down on the database server. Investigate and fix the issue.

### Solution:
```sh
#Check the service status:
sudo systemctl status mariadb

#Start the service if it’s stopped:
sudo systemctl start mariadb

#Enable the service to start on boot:
sudo systemctl enable mariadb

#Verify it’s runningg
sudo systemctl status mariadb
```