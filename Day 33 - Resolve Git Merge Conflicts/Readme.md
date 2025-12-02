### Task - Resolve Git Merge Conflicts

SSH into the storage server as max, go to /home/max/story-blog, fix the push issues, update story-index.txt so it contains titles for all 4 stories, correct the typo “Mooose” → “Mouse”, commit the changes, push to the origin, and verify the repository using the Gitea UI.

### Solution -
```sh
ssh max@ststor01
cd /home/max/story-blog
git push origin master
git pull --rebase origin master

# fix the files
vim story-index.txt               # add all 4 titles
vim stories/lion-and-mouse.txt    # fix "Mooose" -> "Mouse"  

git add story-index.txt
git rebase --continue
git push origin master 
```