# Adding this as a submodule to an existing repo located at ~/Ansible
cd ~/Ansible
git submodule add git@github.com:richard-scott/ansible-profiles.git bin
cd bin
./setup.sh

# Add to a folder (not a git repo)
cd ~/Ansible
git clone git@github.com:richard-scott/ansible-profiles.git bin

