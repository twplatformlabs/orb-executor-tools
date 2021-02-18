# scripts/build.sh
# 
# DOCKERFILE         = Dockerfile name and path
# DOCKERFILE_PATH
# EXTRA_BUILD_ARGS   = Extra flags to pass to docker build. See https://docs.docker.com/engine/reference/commandline/build
#
# REGISTRY           = Registry and image name values for naming the build.
# IMAGE
# AWS_ECR_REPOSITORY = support for aws ecr url, e.g., 123*******.dkr.ecr.us-east-1.amazonaws.com/org/repo:0.1
#
# TAG                = image tag, e.g., v1.0.0, latest

build_image() {
  if [ ! "${AWS_ECR_IMAGE}" ]; then
    echo "Dockerfile: ${DOCKERFILE}"
    echo "image: ${REGISTRY}/${IMAGE}:${TAG}"
    CMD="docker build -f ${DOCKERFILE} -t ${REGISTRY}/${IMAGE}:${TAG} ${EXTRA_BUILD_ARGS} ${DOCKERBUILD_PATH}"
    echo $($CMD)
    # docker build -f "${DOCKERFILE}" -t "${REGISTRY}/${IMAGE}:${TAG}" "${EXTRA_BUILD_ARGS}" "${DOCKERBUILD_PATH}"
  else
    echo "Dockerfile: ${DOCKERFILE}"
    echo "image: ${AWS_ECR_REPOSITORY}/${IMAGE}:${TAG}"
    docker build -f "${DOCKERFILE}" -t "${AWS_ECR_REPOSITORY}/${IMAGE}:${TAG}" "${EXTRA_BUILD_ARGS}" "${DOCKERBUILD_PATH}"
  fi
}

# Will not run if sourced from another script. This is done so this script may be tested.
if [[ "$_" == "$0" ]]; then
    build_image
fi
