#!/bin/bash

echo "install xcode"
xcode-select --install
sudo xcodebuild -license 

echo "Setup HomeBrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "install Ansible" 
brew install ansible

echo "install Ansible-lint"
brew install ansible-lint 

echo "Make ansible dir & host file"
sudo mkdir -p /etc/ansible
sudo touch /etc/ansible/hosts

echo "Add localhost to hosts file" 
printf '[servers]\localhost ansible_connection=local\n' > /etc/ansible/hosts

echo "Start ansible playbook"
ansible-playbook playbook.yml --ask-become-pass
