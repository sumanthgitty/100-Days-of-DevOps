### Question: Install and Configure Tomcat Server

 The Nautilus application development team recently finished the beta version of one of their Java-based applications, which they are planning to deploy on one of the app servers in Stratos DC. After an internal team meeting, they have decided to use the tomcat application server. Based on the requirements mentioned below complete the task:
- Install tomcat server on App Server 2.
- Configure it to run on port 3004.
- There is a ROOT.war file on Jump host at location /tmp.

Deploy it on this tomcat server and make sure the webpage works directly on base URL i.e curl http://stapp02:3004

### Solution:

I used ansbile to complete this task so Install `ansible` and add the following:

- [playbook.yaml](./playbook.yaml)

Run the playbook - `Ansible_Host_Key_Checking=False ansible-playbook -i hosts.ini playbook.yaml`

To verify run `curl http://stapp02:3004`
