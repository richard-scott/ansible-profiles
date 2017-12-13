#!/bin/bash
if [[ ! -d ~/.aws ]]; then
  echo "Unable to find ~/.aws, it doesn't look like you have configured any profiles yet!"
  echo "Please do that and the run this script to add the wrapper hooks"
  exit 1
fi
if ! grep -q Ansible/bin ~/.bashrc ; then
  cd ~
	git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

	echo "Adding hooks to ~/.bashrc to enable use custom 'ansible' wrapper to generate aliases"
	cat >> ~/.bashrc <<-'EOF'

	# Setup GIT Prompt
	GIT_PROMPT_ONLY_IN_REPO=1
	source ~/.bash-git-prompt/gitprompt.sh

	# Get BashOnWindows to save history more frequently
	export PROMPT_COMMAND='history -a'

	# Add hooks to use custom 'ansible' wrapper
	export PATH="${HOME}/Ansible/bin:${PATH}"
	cd ~/Ansible/bin/update-git.sh
	cd ~
  echo "Loading Alias list for:"
	for PROFILE in $(ansible list-profiles) ; do
	  echo "  >> ${PROFILE}"
	  eval "$(ansible ${PROFILE} list instances aliases)"
	done

	EOF
	echo "Please log out and back in again to setup aliases"
fi
