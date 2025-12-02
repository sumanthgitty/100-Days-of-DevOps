#!/bin/bash 
cd /opt/blog.git 

tag=release-$(date '+%Y-%m-%d') 
git tag $tag