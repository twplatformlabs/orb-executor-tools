#!/usr/bin/env bash
set -eo pipefail

echo "Add tag parameter to BASH_ENV."
if [[ -z "$CIRCLE_TAG" ]]; then
  echo "export TAG=$CIRCLE_TAG" >> "$BASH_ENV"
else
  echo "export TAG=$TAG" >> "$BASH_ENV"
fi