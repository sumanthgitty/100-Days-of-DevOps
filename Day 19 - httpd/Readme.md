### Question: Host Two Static Websites Using Apache

xFusionCorp Industries is planning to host two static websites on their infra in Stratos Datacenter. The development of these websites is still in progress, but we want to get the servers ready. Please perform the following steps to accomplish the task:
- Install httpd package and dependencies on app server 3.
- Apache should serve on port 5002.
- There are two website backups /home/thor/news and /home/thor/games on the jump host.
- Set them up on Apache so that:
news works on the link http://localhost:5002/news/
games works on the link http://localhost:5002/games/
- Once configured, verify using:
```sh
curl http://localhost:5002/news/
curl http://localhost:5002/games/
```

### Solution:

I used Ansible to automate the entire setup.

#### 1: Install Ansible (if not already)

`sudo yum install ansible -y`

#### 2: Create the following files:
- [hosts.ini](./hosts.ini)
- [playbook.yaml](./playbook.yaml)

#### 3: Run the playbook
`ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini playbook.yaml`

#### 4: Verify the setup

On app server 3, test the two sites:
```sh
curl http://localhost:5002/news/
curl http://localhost:5002/games/
```