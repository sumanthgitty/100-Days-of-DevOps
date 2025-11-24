### Task - Git Cherry Pick

In the repo /usr/src/kodekloudrepos (cloned from /opt/official.git), merge only the commit with message "Update info.txt" from the feature branch into the master branch, and then push the updated master branch.

### Solution - 
```sh
git checkout feature
git log --oneline        # copy the commit hash message "Update info.txt"
git checkout master
git cherry-pick abc123
git push origin master
```
