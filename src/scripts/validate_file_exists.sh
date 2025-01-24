#!/usr/bin/env bash
set -eo pipefail

echo "validate file:${FILENAME} exists"
if [ -f "$FILENAME" ]; then
   echo "$FILENAME contents"
   cat "$FILENAME"
else
   echo "File $FILENAME does not exist."
   exit 1
fi
