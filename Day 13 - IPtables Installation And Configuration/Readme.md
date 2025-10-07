### Question: IPtables Installation And Configuration

We have one of our websites up and running on our Nautilus infrastructure in Stratos DC. Our security team has raised a concern that right now Apache’s port i.e 6400 is open for all since there is no firewall installed on these hosts. So we have decided to add some security layer for these hosts and after discussions and recommendations we have come up with the following requirements:
- Install iptables and all its dependencies on each app host.
- Block incoming port 6400 on all apps for everyone except for LBR host.
- Make sure the rules remain, even after system reboot.

### Solution: 

I used ansible to complete this task so install **ansible** using 

`sudo yum install ansible -y`

then add the following content:
- [playbook.yaml](./playbook.yaml)
- [hosts.ini](./hosts.ini)

Run `ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini playbook.yaml`

To **verify** run:
- `curl http://stapp01:6400`   # Should fail from non-LBR

- `curl http://stapp01:6400`   # Should succeed from LBR-host