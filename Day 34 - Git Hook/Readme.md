### Task - Git Hook

In repo `/usr/src/kodekloudrepos/blog` (from `/opt/blog.git`), merge feature -> master, then create a post-update hook so that whenever master is pushed, a tag named `release-YYYY-MM-DD` is automatically created using today’s date. Test once to confirm the release tag is generated.

### Solution - 
```sh
ssh natasha@ststor01
cd /usr/src/kodekloudrepos/blog
git branch
git checkout master
git merge feature
vi /opt/blog.git/hooks/post-update    # add the script
chmod +x /opt/blog.git/hooks/post-update
git push
git tag
bash /opt/blog.git/hooks/post-update  # to verify tag
```