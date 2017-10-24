#!/bin/bash
REFRESH=5
echo "Updating GIT Repos"
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    echo "Repo path: ${GR}"
    cd $(dirname ${GR})
    git pull
  fi
done
