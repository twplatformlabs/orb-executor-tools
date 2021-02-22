#!/bin/sh
# shellcheck disable=SC2155,SC2086
# scripts/aws-push.sh
#
# expects circleci 'include' to pass the following environment variables
# REGISTRY
# IMAGE
# TAG
# AWS_ROLE
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION
set -o xtrace
# shellcheck disable=SC1091
source src/scripts/assume-role.sh

if [ "${AWS_ROLE}" ]; then
  Assume
fi

aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin "${REGISTRY}/${IMAGE}"
echo "${REGISTRY}/${IMAGE}:${TAG}"
docker push ${REGISTRY}/${IMAGE}:${TAG}
