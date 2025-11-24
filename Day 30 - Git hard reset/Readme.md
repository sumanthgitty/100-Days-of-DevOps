### Task - Git hard reset

In the repo /usr/src/kodekloudrepos/cluster on the Storage server, a developer pushed several test commits. They now want to clean the repository and reset it back to the commit with message "add data.txt file", removing all commits made after it (including work tree changes).
- In /usr/src/kodekloudrepos/cluster git repository, reset the git commit history so that there are only two commits in the commit history i.e initial commit and add data.txt file.
- Also make sure to push your changes.

### Solution - 
```sh
git log --online     
git reset --hard HEAD~10
# or
git reset --hard <commit-hash>
``` 