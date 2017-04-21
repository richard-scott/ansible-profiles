#!/bin/bash
if [[ ! -d ~/.aws ]]; then
  echo "Unable to find ~/.aws, it doesn't look like you have configured any profiles yet!"
  echo "Please do that and the run this script to add the wrapper hooks"
  exit 1
fi
if ! grep -q Ansible/bin ~/.bashrc ; then
	echo "Adding hooks to ~/.bashrc to enable use custom 'ansible' wrapper to generate aliases"
	cat >> ~/.bashrc <<-'EOF'

	# Add hooks to use custom 'ansible' wrapper
	export PATH="${HOME}/Ansible/bin:${PATH}"
	for PROFILE in $(ansible list-profiles) ; do
	  eval "$(ansible ${PROFILE} list instances aliases)"
	done

	EOF
	echo "Please log out and back in again to setup aliases"
fi
