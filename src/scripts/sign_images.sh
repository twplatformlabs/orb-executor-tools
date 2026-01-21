#!/bin/bash
set -euo pipefail

echo "Adding release tag to existing image manifests."

if [[ ! -f "$BAKEFILE" ]]; then
  echo "Bake file not found: $BAKEFILE" >&2
  exit 1
fi

echo "Using bake file: $BAKEFILE"
echo "release tag: $TAG"
echo

# Extract all targets and their tags
jq -r '
  .target
  | to_entries[]
  | select(.value.tags != null)
  | .key as $name
  | .value.tags[]
  | [$name, .]
  | @tsv
' "$BAKEFILE" |
while IFS=$'\t' read -r target_name raw_tag; do

  # Resolve bake variables
  image_ref="$raw_tag"
  image_ref="${image_ref//\$\{TAG\}/$TAG}"
  image_ref="${image_ref//\$TAG/$TAG}"
  image_ref="$(eval echo "$image_ref")"
  echo "Target: ${target_name}"
  echo "Source image: ${image_ref}"

  # sign image
  #docker buildx imagetools create -t "${release_image_ref}" "${image_ref%@*}@${digest}"

  echo "Success"
  echo
done