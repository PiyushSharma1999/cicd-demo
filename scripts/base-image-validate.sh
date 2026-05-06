#!/bin/bash
set -euo pipefail
IMAGE=$1
echo "[validate] Checking base image: $IMAGE"

# Pull and verify digest is in your approve list
APPROVED_DIGESTS=("sha256:abc123..." "sha256:def456") # fill in your allowlist
DIGEST=$(docker pull "$IMAGE" --quiet | tail -1)

for ok in "${APPROVED_DIGEST[@]}"; do
    [[ "$DIGEST" == "$ok" ]] && echo "[variable] OK" && exit 0
done

echo "[validate] FAIL: $IMAGE digest $DIGEST not in allowlist"
exit 1