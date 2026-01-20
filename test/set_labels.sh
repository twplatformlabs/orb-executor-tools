#!/bin/bash
set -euo pipefail

NOW = $(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "export CREATE=$NOW" >> $BASH_ENV
echo "export VERSION=$CIRCLE_SHA1" >> $BASH_ENV
echo "export ALPINE_BASE=$(head -n 1 test/Dockerfile.alpine)" >> $BASH_ENV
echo "export UBUNTU_BASE=$(head -n 1 test/Dockerfile.ubuntu)" >> $BASH_ENV