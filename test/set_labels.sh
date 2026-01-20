#!/bin/bash
set -euo pipefail

NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
{
  echo "export CREATED=${NOW}" 
  echo "export VERSION=${CIRCLE_SHA1}"
  echo "export ALPINE_BASE=\"$(head -n 1 test/Dockerfile.alpine)\""
  echo "export UBUNTU_BASE=\"$(head -n 1 test/Dockerfile.ubuntu)\""
} >> "$BASH_ENV"