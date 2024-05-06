#!/usr/bin/env bash
set -eo pipefail

echo "bats install depends on nodejs and npm."

if [[ "$BATS_VERSION" == "latest" ]]; then
    npm install -g bats
else
    npm install -g bats@"$BATS_VERSION"
fi
