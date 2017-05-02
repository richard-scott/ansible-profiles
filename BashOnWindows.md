# Notes on installing Bash on Windows along with Git and Ansbile.

1. Follow this to install Bash on Windows in Windows 10:
https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/

2. Setup a username/password for the installation, in my case I chose richard, so replace occurrences of that below with your chosen username.

# Tweak the install and upgrade it to Ubuntu 16.04
```
echo "sudo -i" >> .bashrc
echo "exit $?" >> .bashrc
echo "richard ALL=(ALL) NOPASSWD:ALL"  | sudo tee /etc/sudoers.d/Richard
```
Notes: The above means that you will automatically sudo to root every time you start a bash shell which is handy.

# Now become root
```
sudo -i
```

# Upgrade Ubuntu from v14.04 to v16.04
```
do-release-upgrade -f DistUpgradeViewNonInteractive
mv -f /etc/apt/apt.conf.d/50unattended-upgrades.ucf-dist /etc/apt/apt.conf.d/50unattended-upgrades
apt-get remove --purge $(dpkg -l | grep "^rc" | awk '{print $2}' | tr '\n' ' ')
apt-get --fix-broken install

```
Notes: During the upgrade tasks it seems to keep pausing, so pressing enter every now and then helps as it seems to stall for some reason.

# Create a root SSH Private/Public key pair
```
yes '' | ssh-keygen -N ''
```

# Install AWScli, Ansible, and Git
```
add-apt-repository ppa:ansible/ansible
apt-get update
apt-get install git ansible awscli jq
```


# Optionally add aliases to here:
```
touch ~/.bash_aliases
echo 'alias nano="nano -Sw"' >> .bash_aliases
```
