### Task - Git Rebase

In the repo /usr/src/kodekloudrepos/games (cloned from /opt/games.git), update the feature branch by rebasing it onto the latest master without creating a merge commit, and then push the rebased feature branch to the remote.

### Solution - 
```sh
git checkout master
git pull origin master
git checkout feature
git rebase master
git push --force-with-lease origin feature
```