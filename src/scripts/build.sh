# scripts/build.sh
# 
# DOCKERFILE         = Dockerfile name as path/filename, default = Dockerfile
# DOCKER_BUILD_PATH  = docker build context, default = .
# EXTRA_BUILD_ARGS   = Extra flags to pass to docker build. See https://docs.docker.com/engine/reference/commandline/build
#
# REGISTRY = Docker registry, default = docker.io
# IMAGE    = Image name, required
# TAG      = Image tag, required

build_image() {
  echo "Dockerfile: ${DOCKERFILE}"
  echo "image: ${REGISTRY}/${IMAGE}:${TAG}"
  # shellcheck disable=SC2086
  docker build -f ${DOCKERFILE} -t ${REGISTRY}/${IMAGE}:${TAG} ${EXTRA_BUILD_ARGS} ${DOCKER_BUILD_PATH}
}

# Will not run if sourced from another script. This is done so this script may be tested.
if [[ "$_" == "$0" ]]; then
    build_image
fi
