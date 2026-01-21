#!/bin/bash
set -euo pipefail

echo "Running bats test against images based on docker-bake file targets."

if [[ ! -f "$BAKEFILE" ]]; then
  echo "Bake file not found: $BAKEFILE" >&2
  exit 1
fi

echo "Using bake file: $BAKEFILE"
echo "Using TAG=${TAG}"

# Extract all targets and their tags
jq -r '
  .target
  | to_entries[]
  | select(.value.tags != null)
  | .key as $name
  | .value.tags[]
  | [$name, .]
  | @tsv
' "$BAKEFILE" | while IFS=$'\t' read -r target_name raw_tag; do
  
  # Replace ${TAG} (or $TAG) in the tag string
  image_ref="${raw_tag//\$\{TAG\}/$TAG}"
  image_ref="${image_ref//\$TAG/$TAG}"

  echo "Testing Target: ${target_name}  Image: ${image_ref}"

  # Run bats scan against targets
  # requires bats files to contain any target specific logic
  echo "===== Target: ${target_name}  Image: ${image_ref} ====="
  docker run -it -d --name "${target_name}-container" --entrypoint "${BATS_ENTRY_POINT}" "${image_ref}"
  docker ps
  TEST_CONTAINER="${target_name}-containe" bats "$BATS_TEST_PATH"
  echo
  echo "--- End of ${target_name} test ---"
  echo
done
