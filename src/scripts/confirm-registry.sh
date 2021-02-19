# scripts/confirm-registry.sh
# 
# REGISTRY   # registry to confirm credentials against, e.g., docker.io, quay.io
# IMAGE
#
# DOCKER_LOGIN
# DOCKER_PASSWORD
# 
# AWS_ECR    # use aws ecr
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_REGION
source ./src/scripts/assume-role.sh

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
    if [ ! "${AWS_REGION}" ]; then
      echo "aws region is not defined."
      exit 1
    fi
    if [ "${AWS_ROLE}" ]; then
      assume
    fi
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin "${REGISTRY}/${IMAGE}"
fi
