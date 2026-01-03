### Task - Jenkins Database Backup Job

Create a Jenkins job to automate database backups.
- Login to Jenkins using admin credentials.
- Create a Jenkins job named `database-backup`.
- Take a database dump of `kodekloud_db01` from the Database Server.
- Use database user `kodekloud_roy` with password `asdfgdsd`.
- Name the dump file in `db_$(date +%F).sql` format.
- Copy the dump file to the Backup Server at `/home/clint/db_backups`.
- Schedule the job to run periodically using the cron schedule `*/10 * * * *`.

### Solution -

**Prerequisite – Configure SSH Access**
- Generate an SSH key using ssh-keygen on the Jenkins server and copy the SSH key to the Database Server to allow passwordless access.
- Generate an SSH key using ssh-keygen on the Database Server and copy the SSH key to the Backup Server to allow passwordless file transfer.

#### 1. Login to Jenkins

Login with:
```sh
Username: admin
Password: Adm!n321
```

#### 2. Create Jenkins Job

- Job name: `database-backup`
- Select `Freestyle project`

#### 3. Configure Build Trigger

- Enable `Build periodically`
- Use the exact cron schedule:
```sh
*/10 * * * *
```

#### 4. Configure Build Step

- Go to Build
- Click Add build step > `Execute shell on remote` 
- Add the following commands:
```sh
mysqldump -h stdb01 -u kodekloud_roy -pasdfgdsd kodekloud_db01 > db_$(date +%F).sql

scp db_$(date +%F).sql clint@stbkp01:/home/clint/db_backups
```
- Click Save