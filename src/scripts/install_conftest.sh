#!/usr/bin/env bash
set -eo pipefail

# Fetch the latest version of conftest
get_latest_cli_version() {
    CONFTEST_VERSION=$(curl -L -s https://api.github.com/repos/open-policy-agent/conftest/releases/latest | jq -r .tag_name)
    CONFTEST_VERSION="${CONFTEST_VERSION//v}"
}

# Install conftest
install_conftest_cli() {
    echo "Installing conftest CLI version v${CONFTEST_VERSION}"
    curl -L "https://github.com/open-policy-agent/conftest/releases/download/v${CONFTEST_VERSION}/conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz" --output "conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz"
    sudo tar -xzf "conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz" -C /usr/local/bin conftest
    rm "conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz"
}

if [[ "$CONFTEST_VERSION" == "latest" ]]; then
    get_latest_cli_version
fi

install_conftest_cli
conftest --version
