#!/usr/bin/env bash
set -eo pipefail

echo "Add parameter to BASH_ENV."
echo "export TAG=$TAG" >> $BASH_ENV