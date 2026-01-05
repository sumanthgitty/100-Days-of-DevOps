### Task - Jenkins Conditional Pipeline

Create a Jenkins pipeline job to deploy a static website conditionally based on a branch parameter.
- Login to Jenkins using username admin and password `Adm!n321`.
- Login to Gitea using username sarah and password Sarah_pass123 and verify the web_app repository.
- Add a Jenkins slave node named `Storage Server` with label `ststor01` and remote root directory `/var/www/html`.
- The web_app repository is already cloned on the Storage Server under /var/www/html.
- Apache is already installed and running on all App Servers on port 8080.
- Create a Jenkins Pipeline job named `devops-webapp-job` (not a Multibranch pipeline).
- Add a string parameter named `BRANCH`.
  - Configure the pipeline to conditionally deploy:
  - master branch when `BRANCH=master`
  - feature branch when `BRANCH=feature`
- Use a single pipeline stage named `Deploy` (case sensitive).

### Solution - 
#### 1. Click on the Jenkins button on the top bar and login using:
```sh
Username: admin
Password: Adm!n321
```

#### 2. Click on the Gitea button on the top bar and login using:
```sh
Username: sarah
Password: Sarah_pass123
```
Verify the repository named web_app.

#### 3. Install necessary plugins 

- Install required Jenkins plugins:
  - SSH
  - SSH Agent
  - Credentials
  - Git
  - Pipeline
- Creat Jenkins credentials using `username and password` for storage server.

#### 4. In Jenkins, add a slave node with:

- Node name: `Storage Server`
- Label: `ststor01`
- Remote root directory: `/var/www/html`
- Launch method: `SSH`
- Verify the node is online.

#### 5. Create a Pipeline job named devops-webapp-job.

- Enable This project is parameterized and add:
- String parameter:
  - Name: `BRANCH`
- Configure the pipeline script to:
  - Run on agent with label `ststor01`
- Use a single stage named `Deploy`
  - Conditionally deploy the master branch when `BRANCH=master`
  - Conditionally deploy the feature branch when `BRANCH=feature`

Save the job and trigger Build with Parameters using master or feature.
```sh
pipeline {
    agent { label 'ststor01' }

    stages {
        stage('Deploy') {
            when {
                expression {
                    params.BRANCH == 'master' || params.BRANCH == 'feature'
                }
            }
            steps {
                sh '''
                    cd /var/www/html
                    git checkout $BRANCH
                    git pull origin $BRANCH
                '''
            }
        }
    }
}
```