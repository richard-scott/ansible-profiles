#!/bin/bash
echo "Checking GIT Repos:"
cd $(dirname ${0})
echo "  >> $(pwd)"
if [[ $(git remote -v | wc -l) -gt 0 ]]; then
  git pull | egrep -v "^Already up-to-date.$"
fi
cd
REFRESH=${1:-5}
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    echo "  >> $(dirname ${GR})"
    cd $(dirname ${GR})
    if [[ $(git remote -v | wc -l) -gt 0 ]]; then
      git pull | egrep -v "^Already up-to-date.$"
    fi
  fi
done
