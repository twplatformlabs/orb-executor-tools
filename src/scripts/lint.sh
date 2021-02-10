# scripts/lint.sh
# 
# USE_DOCKER = boolean, use docker image to run hadolint
# IMAGE = Image to use for Docker hadolint run
# DOCKERFILE = path/file of Dockerfile

lint() {
  echo "Debug:"
  echo "${USE_DOCKER}"
  echo "${IMAGE}"
  echo "${DOCKERFILE}"

  if [[ "${USE_DOCKER}" == 1 ]]; then
    ls -la
    docker run --rm -i "${IMAGE}" < "${DOCKERFILE}"
  else
    hadolint "${DOCKERFILE}"
  fi
}

# Will not run if sourced from another script. This is done so this script may be tested.
if [[ "$_" == "$0" ]]; then
    lint
fi
