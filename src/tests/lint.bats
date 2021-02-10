# src/tests/lint.bats

setup() {
    source ./src/scripts/lint.sh

    export USE_DOCKER=1
    export IMAGE="docker.io/hadolint/hadolint"
    export DOCKERFILE="Dockerfile"
    cat <<EOF > Dockerfile
FROM node:12-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EOF
}

@test 'Test: executor-tools/lint' {
    echo "dev tests:"
    echo "USE_DOCKER = $USE_DOCKER"
    echo "IMAGE      = ${IMAGE}"
    echo "DOCKERFILE = ${DOCKERFILE}\n\n"
    lint
}

function teardown() {
    rm Dockerfile
}
