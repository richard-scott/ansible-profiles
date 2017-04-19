# Setup Notes.
clone into ~/Ansible
add this to .bashrc:

export PATH="${HOME}/Ansible/bin:${PATH}"
for P in $(list-ansible-profiles) ; do
  eval "$(ansible ${P} list instances aliases)"
done
