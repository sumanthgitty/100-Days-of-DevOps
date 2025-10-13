### Question: Configure LAMP server
xFusionCorp Industries is planning to host a WordPress website on their infra in Stratos Datacenter. They have already done infrastructure configuration—for example, on the storage server they already have a shared directory /vaw/www/html that is mounted on each app host under /var/www/html directory. Please perform the following steps to accomplish the task:

- Install httpd, php and its dependencies on all app hosts.
- Apache should serve on port 5000 within the apps.
- Install/Configure MariaDB server on DB Server.
- Create a database named kodekloud_db8 and create a database user named kodekloud_rin identified as password LQfKeWWxWD. Further make sure this newly created user is able to perform all operation on the database you created.
- Finally you should be able to access the website on LBR link, by clicking on the App button on the top bar. You should see a message like App is able to connect to the database using user kodekloud_rin

### Solution:
I used Ansible to complete this task so 
```sh
sudo yum install ansible -y
```

Add the following content:
- [hosts.ini](./hosts.ini)
- [playbook.yaml](./playbook.yaml)

Run the command:
```sh
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini playbook.yaml
```

verify:
check from host `curl http://stdb01:5000``