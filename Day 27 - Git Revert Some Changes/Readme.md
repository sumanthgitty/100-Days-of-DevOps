### Task - Revert Latest Commit in the Beta Repository

The Nautilus application development team reported an issue with the latest commit pushed to the `/usr/src/kodekloudrepos/beta` repository on the Storage server in Stratos DC. They have requested the DevOps team to revert the most recent commit `(HEAD)` back to the `previous commit`, which contains the initial commit message Use `revert beta` message for the new revert commit.

### Solution -
```bash
cd /usr/src/kodekloudrepos/beta
git revert HEAD --no-edit
git commit --amend -m "revert beta"
```
To check the latest commit in short form, use:
```sh
git log -1 --oneline
```
