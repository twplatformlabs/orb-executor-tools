#!/usr/bin/env bash
set -eo pipefail

# set apt repository
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update

if [[ "$VAULT_VERSION" == "latest" ]]; then
    sudo apt install vault
else
    sudo apt install vault=$VAULT_VERSION
fi
