# src/tests/lint.bats

setup() {
    source ./src/scripts/confirm-registry.sh

    export REGISTRY="docker.io"
}

@test 'Test: executor-tools/confirm-registry' {
    echo "dev tests:"
    echo "REGISTRY = ${REGISTRY}"
    confirm-registry
}

function teardown() {
    rm Dockerfile
}
