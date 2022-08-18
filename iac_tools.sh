#!/bin/bash

apt install curl unzip -y

##Installing Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt-get update && sudo apt-get install terraform -y

##Installing VIM RC
curl https://raw.githubusercontent.com/linuxacademy/content-hashicorp-packer/master/env/vimrc -o ~/.vimrc

##Installing Packer Plugins for VIM
mkdir -p ~/.vim/pack/jvirtanen/start
cd .vim/pack/jvirtanen/start
git clone https://github.com/jvirtanen/vim-hcl.git


##Installing AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

#Verifying installations
aws --version 
terraform --version
