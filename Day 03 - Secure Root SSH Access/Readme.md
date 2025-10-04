### Question:
Disable direct root SSH login on all app servers.

### Solution (Ansible):

- Install ansbile.
```sh
playbook.yaml 
- name: Disable root ssh on app-servers
  hosts: appservers
  become: yes
  tasks:
    - name: ensure PermitRootLogin set to no 
      lineinfile:
        path: /etc/ssh/sshd_config
        regexp: '^#?PermitRootLogin'
        line: 'PermitRootLogin no'
        state: present

    - name: restart sshd
      service:
        name: sshd
        state: restarted
```

- Steps to run:
```sh
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini disable_root_ssh.yaml
```