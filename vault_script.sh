############################
### VAULT INSTALL SCRIPT ###
############################

#!/bin/bash
apt-get update -y 
apt install unzip -y
mkdir vault_tmp
curl https://releases.hashicorp.com/vault/1.11.3/vault_1.11.3_linux_amd64.zip > vault_tmp/vault.zip
unzip vault_tmp/vault.zip
mv vault /usr/local/bin
vault version


########################################################
##  ____            _ _              _____       _    ##
## |  _ \ __ _ _ __(_) |_ __ _ _ __ | ____|_ __ | |_  ##
## | |_) / _` | '__| | __/ _` | '_ \|  _| | '_ \| __| ##
## |  _ < (_| | |  | | || (_| | | | | |___| | | | |_  ## 
## |_| \_\__,_|_|  |_|\__\__,_|_| |_|_____|_| |_|\__| ##
##                                                    ##
########################################################