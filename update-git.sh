#!/bin/bash
cd $(dirname ${0})
git pull | egrep -v "^Already up-to-date.$"
cd
REFRESH=5
echo "Updating GIT Repos"
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    echo "Repo path: ${GR}" | sed 's|/.git$//'
    cd $(dirname ${GR})
    git pull | egrep -v "^Already up-to-date.$"
  fi
done
