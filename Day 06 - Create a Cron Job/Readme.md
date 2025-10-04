### Question:
Install cronie package on all app servers and add a cron job for root:
```sh
*/5 * * * * echo hello > /tmp/cron_text  
```

### Solution (Ansible):
Install ansible using yum install ansible -y
```sh
- name: Install cronie and configure cron job
  hosts: appservers
  become: yes
  tasks:
    - name: Install cronie
      yum:
        name: cronie
        state: present

    - name: Ensure crond service is running
      service:
        name: crond
        state: started
        enabled: yes

    - name: Add cron job for root
      cron:
        name: "Echo hello to /tmp/cron_text every 5 minutes"
        minute: "*/5"
        job: "echo hello > /tmp/cron_text"
```

Steps to run:
```sh
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini cron_job.yaml
```