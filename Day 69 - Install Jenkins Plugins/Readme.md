### Task - Install Jenkins Plugins

Install required Jenkins plugins for CI/CD jobs.

- Login to Jenkins using provided credentials. username "admin", password "Adm!n321"
- Install Git and GitLab plugins.
- Restart Jenkins if prompted after plugin installation.

### Solution - 

- Open Jenkins UI using the Jenkins button on the top bar. Login with:
  - Username: `admin`
  - Password: `Adm!n321`
- Navigate to `Manage Jenkins` > `Manage Plugins` > `Available`.
- Search and select `Git` and `GitLab plugins`.
- Click Install without restart or Download now and install after restart.
- If prompted, select `Restart Jenkins when installation is complete and no jobs are running`.
- Verify plugins under `Manage Plugins` > `Installed`.