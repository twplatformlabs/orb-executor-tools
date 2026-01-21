#!/bin/bash
set -euo pipefail

if [[ ! -f "$BAKEFILE" ]]; then
  echo "Bake file not found: $BAKEFILE" >&2
  exit 1
fi

echo "Using bake file: $BAKEFILE"
echo "Using TAG=${TAG}"
echo "Output file: $OUTFILE"

# Clear/create output file with header
{
  echo "=== Docker Scout CVE Scan Results ==="
  echo "Generated: $(date)"
  echo "Bake file: $BAKEFILE"
  echo "TAG: $TAG"
  echo
} > "workspace/$OUTFILE"

# Extract all targets and their tags, append scan results to OUTFILE
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

  echo "Scanning Target: ${target_name}  Image: ${image_ref}" | tee -a "workspace/$OUTFILE"

  # Run Docker Scout CVE scan and append to OUTFILE
  {
    echo "===== Target: ${target_name}  Image: ${image_ref} ====="
    docker scout cves "$image_ref" --details
    docker scout recommendations "$image_ref"
    echo
    echo "--- End of ${target_name} scan ---"
    echo
  } >> "workspace/$OUTFILE"

done

echo "All scans complete. Results saved to: workspace/$OUTFILE"
