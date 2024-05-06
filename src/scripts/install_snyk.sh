#!/usr/bin/env bash
set -eo pipefail

echo "snyk install depends on nodejs and npm."

if [[ "$SNYK_VERSION" == "latest" ]]; then
    sudo npm install -g snyk
else
    npm install -g snyk@"$SNYK_VERSION"
fi
