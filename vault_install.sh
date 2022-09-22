#!/bin/bash

## installing Vault 

curl --silent -Lo /tmp/vault.zip https://releases.hashicorp.com/vault/1.11.3/vault_1.11.3_linux_amd64.zip 
cd /tmp
sudo unzip vault.zip 
sudo mv vault /usr/local/bin 
