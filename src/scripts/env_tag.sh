#!/usr/bin/env bash
set -eo pipefail

echo "Add $TAG parameter to BASH_ENV."
echo "CIRCLE_SHA1=$CIRCLE_SHA1"
echo "CIRCLE_TAG=$CIRCLE_TAG"

# always set ENV var to the build commit tag provided by the job. Default is dev.${CIRCLE_SHA1:0:7}
echo "export TAG=$TAG" >> "$BASH_ENV"

# if [[ -z "$CIRCLE_TAG" ]]; then
#   echo "export TAG=$TAG" >> "$BASH_ENV"
# else
#   echo "export TAG=$CIRCLE_TAG" >> "$BASH_ENV"
# fi