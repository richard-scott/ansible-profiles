#!/bin/bash
echo "Updating GIT Repos"
cd $(dirname ${0})
echo "Repo path: $(pwd)"
git pull | egrep -v "^Already up-to-date.$"
cd
REFRESH=5
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    echo "Repo path: ${GR}" | sed 's|/.git$//'
    cd $(dirname ${GR})
    git pull | egrep -v "^Already up-to-date.$"
  fi
done
