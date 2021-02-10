# scripts/lint.sh
# 
# USE_DOCKER = if 1 use docker image to run hadolint
# IMAGE = Image to use for Docker hadolint run
# DOCKERFILE = path/file of Dockerfile

lint() {
  if [[ "${USE_DOCKER}" == 1 ]]; then
    docker run --rm -i "${IMAGE}" < "${DOCKERFILE}"
  else
    hadolint "${DOCKERFILE}"
  fi
}

# Will not run if sourced from another script. This is done so this script may be tested.
if [[ "$_" == "$0" ]]; then
    lint
fi
