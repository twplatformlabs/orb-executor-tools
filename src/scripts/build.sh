# scripts/build.sh
# 
# DOCKERFILE        = Dockerfile name and path
# PATH
# EXTRA_BUILD_ARGS  = Extra flags to pass to docker build. See https://docs.docker.com/engine/reference/commandline/build
#
# REGISTRY          = Registry and image name values for naming the build.
# IMAGE
# AWS_ECR_IMAGE     = support for aws ecr url, e.g., 123*******.dkr.ecr.us-east-1.amazonaws.com/org/repo:0.1
#
# TAG               = image tag, e.g., v1.0.0, latest

build_image() {
  if [ ! "${AWS_ECR_IMAGE}" ]; then
    pwd
    docker build "${EXTRA_BUILD_ARGS}" -t "${REGISTRY}/${IMAGE}:${TAG}" -f "${PATH}/${DOCKERFILE}" 
  else
    docker build "${EXTRA_BUILD_ARGS}" -t "${AWS_ECR_IMAGE}:${TAG}" -f "${PATH}/${DOCKERFILE}"
  fi
}

# Will not run if sourced from another script. This is done so this script may be tested.
if [[ "$_" == "$0" ]]; then
    build_image
fi
