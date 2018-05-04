#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Go To .io repo
cd ../UnderfundedHackers.github.io

# Clear prod files for the .io repo
rm -rf *

# Go To Website-Hugo-Files repo
cd ../Website-Hugo-Files

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Add files to the .io repo
cp -r public/* ../UnderfundedHackers.github.io/

# Go To .io repo
cd ../../UnderfundedHackers.github.io

git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ../Website-Hugo-Files