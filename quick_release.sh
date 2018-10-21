#!/bin/bash

if [ -z "$1" ]
then
    echo "Usage: ./quick_release \"1.3.2\""
    echo "No argument given, abort!"
else
    git checkout -b release-$1 develop
    sed -i '$ d' README.md
    echo "v$1" >> README.md
    git checkout master
    git merge -m "Release $1" release-$1
    git tag -a v$1
    git push origin master
    git push origin v$1
    git checkout develop
    git merge -m "Release $1" --no-ff release-$1
    git branch -d release-$1
    git push origin develop
fi
