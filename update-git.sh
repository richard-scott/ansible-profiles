#!/bin/bash
echo "Checking GIT Repos:"
cd $(dirname ${0})
if [[ $(git remote -v | wc -l) -gt 0 ]]; then
  echo "  >> $(pwd)"
  git pull 2>/dev/null | egrep -v "^Already up-to-date.$"
fi
cd
REFRESH=${1:-30}
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    cd $(dirname ${GR})
    if [[ $(git remote -v | wc -l) -gt 0 ]]; then
      echo "  >> $(dirname ${GR})"
      git pull 2>/dev/null | egrep -v "^Already up-to-date.$"
    fi
  fi
done
