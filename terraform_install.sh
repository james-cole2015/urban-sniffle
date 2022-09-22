################################
#~~ TERRAFORM INSTALL SCRIPT ~~#
################################

#!/bin/bash

## Pre-Reqs ##
echo "Installing pre-reqs.."
apt-get update -y 
apt install curl unzip -y 

## Installing Terraform ##
echo "Installing Terraform.."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
sudo apt-get update && sudo apt-get install terraform -y

########################################################
##  ____            _ _              _____       _    ##
## |  _ \ __ _ _ __(_) |_ __ _ _ __ | ____|_ __ | |_  ##
## | |_) / _` | '__| | __/ _` | '_ \|  _| | '_ \| __| ##
## |  _ < (_| | |  | | || (_| | | | | |___| | | | |_  ## 
## |_| \_\__,_|_|  |_|\__\__,_|_| |_|_____|_| |_|\__| ##
##                                                    ##
########################################################