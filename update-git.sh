#!/bin/bash
REFRESH=3
echo "Updating GIT Repos"
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    cd $(dirname ${GR})
    git pull
  fi
done
