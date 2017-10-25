#!/bin/bash
echo "Checking GIT Repos:"
cd $(dirname ${0})
echo "  >> $(pwd)"
git pull | egrep -v "^Already up-to-date.$"
cd
REFRESH=5
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    echo "  >> $(dirname ${GR})"
    cd $(dirname ${GR})
    git pull | egrep -v "^Already up-to-date.$"
  fi
done
