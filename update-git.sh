#!/bin/bash
echo "Checking GIT Repos:"
cd $(dirname ${0})
function pull()
{
  git pull 2>/dev/null | egrep -v "^Already up-to-date.$"
}
if [[ $(git remote -v | wc -l) -gt 0 ]]; then
  echo "  >> $(pwd)"
  pull
fi
cd
REFRESH=${1:-90}
echo "Scanning for GIT repos..."
for GR in $(find ~ -name .git) ; do
  if [ $(find ${GR} -maxdepth 0 -type d -mmin +${REFRESH} | wc -l) -gt 0 ]; then
    cd $(dirname ${GR})
    if [[ $(git remote -v | wc -l) -gt 0 ]]; then
      echo "  >> $(dirname ${GR})"
      #read < <( git pull & echo $! )
      pull
    fi
  fi
done
echo "Waiting..."
while pgrep --parent 1 --full "git pull" >/dev/null 2>&1 ; do
  true
done
echo "Done."
