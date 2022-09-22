######################
### VIM RC INSTALL ###
######################

#!/bin/bash
## Pre-Reqs ##
echo "Installing pre-reqs.."
apt-get update -y 
apt install curl unzip -y 

## payload ##
echo "installing vimrc profile"
curl https://raw.githubusercontent.com/linuxacademy/content-hashicorp-packer/master/env/vimrc -o ~/.vimrc





########################################################
##  ____            _ _              _____       _    ##
## |  _ \ __ _ _ __(_) |_ __ _ _ __ | ____|_ __ | |_  ##
## | |_) / _` | '__| | __/ _` | '_ \|  _| | '_ \| __| ##
## |  _ < (_| | |  | | || (_| | | | | |___| | | | |_  ## 
## |_| \_\__,_|_|  |_|\__\__,_|_| |_|_____|_| |_|\__| ##
##                                                    ##
########################################################