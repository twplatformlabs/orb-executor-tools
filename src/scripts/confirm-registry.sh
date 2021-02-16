# scripts/confirm-registry.sh
# 
# REGISTRY   # registry to confirm credentials against, e.g., docker.io, quay.io
# DOCKER_LOGIN
# DOCKER_PASSWORD
# 
# AWS_ECR_IMAGE   # ecr url, e.g., 123*******.dkr.ecr.us-east-1.amazonaws.com/org/repo:0.1
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_REGION

confirm-registry() {
  if [ ! "${AWS_ECR_IMAGE}" ]; then
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
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin "${AWS_ECR_IMAGE}"
  fi
}

# Will not run if sourced from another script. This is done so this script may be tested.
if [[ "$_" == "$0" ]]; then
    confirm-registry
fi
