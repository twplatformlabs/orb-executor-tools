#!/usr/bin/env bash
set -eo pipefail

# Fetch the latest version of grype CLI
get_latest_cli_version() {
    GRYPE_VERSION=$(curl -L -s https://api.github.com/repos/anchore/grype/releases/latest | jq -r .tag_name)
    GRYPE_VERSION="${GRYPE_VERSION//v}"
}

# Install grype
install_grype_cli() {
    echo "Installing grype version v${GRYPE_VERSION}"
    curl -L "https://github.com/anchore/grype/releases/download/v${GRYPE_VERSION}/grype_${GRYPE_VERSION}_linux_amd64.tar.gz" --output "grype_${GRYPE_VERSION}_linux_amd64.tar.gz"
    sudo tar -xzf "grype_${GRYPE_VERSION}_linux_amd64.tar.gz" -C /usr/local/bin grype
    rm "grype_${GRYPE_VERSION}__linux_amd64.tar.gz"
}

if [[ "$GRYPE_VERSION" == "latest" ]]; then
    get_latest_cli_version
fi

install_grype_cli
grype version
