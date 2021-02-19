# scripts/push.sh
# 
# REGISTRY    # image to push
# IMAGE
# TAG
#
# DOCKER_LOGIN
# DOCKER_PASSWORD
# 
# AWS_ECR    # use aws ecr
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_REGION

push() {
  if [ ! "${AWS_ECR}" ]; then
      echo 'docker login'
      echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_LOGIN}" --password-stdin "${REGISTRY}"
  else
      echo 'aws login'
      aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin "${REGISTRY}/${IMAGE}"
  fi
  echo 'push'
  docker push "${REGISTRY}/${IMAGE}:${TAG}"
}

# Will not run if sourced from another script. This is done so this script may be tested.
if [[ "$_" == "$0" ]]; then
    push
fi
