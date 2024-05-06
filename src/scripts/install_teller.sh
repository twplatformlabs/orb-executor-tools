#!/usr/bin/env bash
set -eo pipefail

# Fetch the latest version of teller CLI
get_latest_cli_version() {
    TELLER_VERSION=$(curl -L -s https://api.github.com/repos/tellerops/teller/releases/latest | jq -r .tag_name)
    TELLER_VERSION="${TELLER_VERSION//v}"
}

# Install teller
install_teller_cli() {
    echo "Installing Teller CLI version v${TELLER_VERSION}"
    curl -L "https://github.com/tellerops/teller/releases/download/v${TELLER_VERSION}/teller_${TELLER_VERSION}_Linux_x86_64.tar.gz" --output "teller_${TELLER_VERSION}_Linux_x86_64.tar.gz"
    sudo tar -xzf "teller_${TELLER_VERSION}_Linux_x86_64.tar.gz" -C /usr/local/bin teller
    rm "teller_${TELLER_VERSION}_Linux_x86_64.tar.gz"
}

if [[ "$TELLER_VERSION" == "latest" ]]; then
    get_latest_cli_version
fi

install_teller_cli
teller version
