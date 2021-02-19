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

echo "IMAGE: ${REGISTRY}/${IMAGE}:${TAG}"
if [ ! "${AWS_ECR}" ]; then
    echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_LOGIN}" --password-stdin "${REGISTRY}"
else
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin "${REGISTRY}/${IMAGE}"
fi
docker push "${REGISTRY}/${IMAGE}:${TAG}"
