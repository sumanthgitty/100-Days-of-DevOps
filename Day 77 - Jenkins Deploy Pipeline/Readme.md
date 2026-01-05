### Task - Jenkins Deploy Pipeline

- Login to Jenkins using admin credentials.
- Login to Gitea as user sarah and verify the `web_app repository`.
- Add a Jenkins `slave node` named `Storage Server` with:
  - Label: `ststor01`
  - Remote root directory: `/var/www/html`
- The `web_app repository` is already cloned on the `Storage Server` under `/var/www/html`.
- Create a Jenkins Pipeline job named `devops-webapp-job` (not Multibranch).
- Configure the pipeline to deploy the code from `/var/www/html` on the `Storage Server`.
- Use a single pipeline stage named `Deploy`.
- Apache is already running on all app servers and serving content from /var/www/html.
- Verify the deployment via the Load Balancer URL (no subdirectory in the URL).

### Solution - 

#### 1. Prepare Storage Server

- Logged in to the `Storage Server`.
- Installed `Java (required for Jenkins agent)`.
- Verified that `/var/www/html` exists.
- Changed ownership of `/var/www/html` from `sarah to natasha` so Jenkins can deploy files.

#### 2. Prepare Jenkins

- Installed required Jenkins plugins:
  - SSH
  - SSH Agent
  - Credentials
  - Git
  - Pipeline
- Created Jenkins credentials using `username and password` for storage server.

#### 3. Add Storage Server as Jenkins Agent

- Added a slave node named `Storage Server`.
- Set label to `ststor01`.
- Set remote root directory to `/var/www/html`.
- Configured launch method `via SSH` using the `created credentials`.
- Verified the node is online.

#### 4. Create Pipeline Job

- Created a Pipeline job named `devops-webapp-job`.
- Configured the pipeline to run on agent label `ststor01`.
- Pipeline clones the repository into `/tmp/app` and copies the files to `/var/www/html`.
- Used a single stage named `Deploy`.
```sh
pipeline {
    agent { label 'ststor01' }

    stages {
        stage('Deploy') {
            steps {
                sh '''
                    echo "Deployment started"
                    git clone http://git.stratos.xfusioncorp.com/sarah/web_app.git /tmp/app
                    cp -r /tmp/app/* /var/www/html/
                    echo "Deployment Finished"
                '''
            }
        }
    }
}
```

#### 5. Verification

- Pipeline executed successfully.
- Website changes are visible via app button or the Load Balancer URL.