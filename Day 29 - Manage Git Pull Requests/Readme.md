### Task - Manage Git Pull Requests

Max wants to add his story to the repository without pushing directly to the master branch. Follow the steps below to create a Pull Request (PR), assign a reviewer, and merge it after approval.

### Solution - 

#### 1. SSH as max and check the repo
```sh
ssh max@<storage-server>      # password: Max_pass123
cd ~/                         # go to Max's home
cd <repo-folder>
git log --oneline             # verify commits and author info
ls -la                        # confirm Sarah's story exists
```
#### 2. Confirm Max’s branch exists
```sh
git branch -a                 # check for story/fox-and-grapes
```
#### 3. Create PR in Gitea (UI)
Open Gitea UI (top bar link).
Login:
- Username: max
- Password: Max_pass123

Go to the repo → Pull Requests → New Pull Request.
- PR Title: Added fox-and-grapes story
- Pull from: story/fox-and-grapes
- Merge into: master

Create PR.

#### 4. Assign tom as reviewer (UI)
Open the newly created PR.
- Click Reviewers on the right.
- Add tom as reviewer.

#### 5. Review & merge PR as tom
Logout max.
Login:
- Username: tom
- Password: Tom_pass123

Open the PR: `Added fox-and-grapes story`
- Review and Merge the PR.