# scripts/aws-push.sh
# shellcheck disable=SC2155,SC2086

# REGISTRY   # registry to confirm credentials against, e.g., docker.io, quay.io
# IMAGE
#
# DOCKER_LOGIN
# DOCKER_PASSWORD
# 
# AWS_ECR    # use aws ecr
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

# shellcheck disable=SC1091
source src/scripts/assume-role.sh

if [ "${AWS_ROLE}" == 1 ]; then
  Assume
fi

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin "${REGISTRY}/${IMAGE}"
docker push ${REGISTRY}/${IMAGE}:${TAG}
