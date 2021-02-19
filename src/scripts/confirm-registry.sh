#!/bin/sh
# scripts/confirm-registry.sh
#
# expects circleci 'include' to pass the following environment variables
# REGISTRY
# IMAGE
# DOCKER_LOGIN
# DOCKER_PASSWORD
# AWS_ECR
# AWS_ROLE
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

# shellcheck disable=SC1091
source src/scripts/assume-role.sh

echo 'here'
echo "${AWS_ROLE}"
if [ ! "${AWS_ECR}" ]; then
    if [ ! "${DOCKER_LOGIN}" ]; then
      echo "registry username is not defined."
      exit 1
    fi
    if [ ! "${DOCKER_PASSWORD}" ]; then
      echo "registry password is not defined."
      exit 1
    fi
    echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_LOGIN}" --password-stdin "${REGISTRY}"
else
    if [ ! "${AWS_ACCESS_KEY_ID}" ]; then
      echo "ecr access key id is not defined."
      exit 1
    fi
    if [ ! "${AWS_SECRET_ACCESS_KEY}" ]; then
      echo "ecr secret access key is not defined."
      exit 1
    fi
    if [ ! "${AWS_DEFAULT_REGION}" ]; then
      echo "aws region is not defined."
      exit 1
    fi
    if [ "${AWS_ROLE}" == 1 ]; then
      Assume
    fi
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin "${REGISTRY}/${IMAGE}"
fi
