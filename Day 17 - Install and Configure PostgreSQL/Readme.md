### Question: Install and Configure Web PostgreSQL

The Nautilus application development team has shared that they are planning to deploy one newly developed application on Nautilus infra in Stratos DC. The application uses PostgreSQL database, so as a pre-requisite we need to set up PostgreSQL database server as per requirements shared below:

PostgreSQL database server is already installed on the Nautilus database server.

- Create a database user `kodekloud_top` and set its password to `dCV3szSGNA`.

- Create a database `kodekloud_db9` and grant full permissions to user `kodekloud_top` on this database.

### Solution:
#### 1. Login to database server and Switch to the postgres user
```sh
sudo -u postgres psql
```
#### 2. Create a new user
```sh
CREATE USER kodekloud_sam WITH PASSWORD 'Rc5C9EyvbU';
```
#### 3. Create a new database
```sh
CREATE DATABASE kodekloud_db5;
```
#### 4. Grant full privileges on the database to the user
```sh
GRANT ALL PRIVILEGES ON DATABASE kodekloud_db5 TO kodekloud_sam;
```

Exit PostgreSQL shell

`\q`

#### 5. Verify (optional)
You can connect using the new user to verify:
```sh
psql -U kodekloud_sam -d kodekloud_db5 -h localhost
```
