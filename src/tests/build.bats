# src/tests/build.bats

setup() {
    source ./src/scripts/build.sh

    # create Dockerfile
    run bash -c "cat <<EOF > Dockerfile
FROM busybox:latest
CMD ["date"]
EOF"

}

@test 'Test standard build with extra-build-args: executor-tools/build' {
    local DOCKERFILE="Dockerfile"
    local PATH="scripts"
    local EXTRA_BUILD_ARGS='--label test="build.bats"'

    local REGISTRY="docker.io"
    local IMAGE="twdps/test"
    local TAG="latest"

    echo "dev tests:"
    echo "DOCKERFILE = ${DOCKERFILE}"
    echo "PATH = ${PATH}"
    echo "EXTRA_BUILD_ARGS = ${EXTRA_BUILD_ARGS}"
    echo "REGISTRY = ${REGISTRY}"
    echo "IMAGE = ${IMAGE}"
    echo "TAG = ${TAG}"

    build_image
    [[ "${output}" =~ "Successfully tagged twdps/test:latest" ]]
}

@test 'validate extra-build-args: executor-tools/build' {
    run bash -c "docker inspect twdps/test:latest"
    [[ "${output}" =~ "\"test\": \"build.sh\"" ]]
}

@test 'validate docker image: executor-tools/build' {
    run bash -c "docker run -it twdps/test:latest"
    [[ "${output}" =~ "UTC" ]]
}

@test 'Test aws ecr build: executor-tools/build' {
    export DOCKERFILE="Dockerfile"
    export PATH="scripts"
    export EXTRA_BUILD_ARGS='--label test="build.bats"'
    export AWS_ECR_IMAGE="090950721693.dkr.ecr.us-east-1.amazonaws.com/twdps/test"
    local TAG="latest"
    echo "dev tests:"
    echo "DOCKERFILE = ${DOCKERFILE}"
    echo "PATH = ${PATH}"
    echo "AWS_ECR_IMAGE = ${REGISTRY}"
    echo "TAG = ${TAG}"

    build_image
    [[ "${output}" =~ "Successfully tagged 090950721693.dkr.ecr.us-east-1.amazonaws.com/twdps/test:latest" ]]
}

function teardown() {
    rm Dockerfile
}
