#!/bin/bash
REFRESH=5
echo -n "Updating GIT Repos."
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    echo -n "."
    cd $(dirname ${GR})
    git pull --quiet >/dev/null 2>&1
  fi
done
echo "."
