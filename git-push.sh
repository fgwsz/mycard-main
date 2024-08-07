#!/bin/bash
root_path=$(dirname "$(readlink -f "$0")")
echo "You Can Input q For Abort."
read -p "Input Git Commit Info: " commit_info
if [ "$commit_info" != "q" ]; then
    cd $root_path
    git add ./README.md
    git add ./.gitignore
    git add ./build.sh
    git add ./package.json
    git add ./run.sh
    git add ./git-push.sh
    git add ./run-ygopro.sh
    git commit -m "$commit_info"
    git push
fi
