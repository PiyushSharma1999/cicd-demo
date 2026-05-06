#!/bin/bash
set -euo pipefail
IMAGE=$1
echo "[validate] Checking base image: $IMAGE"

# Pull and verify digest is in your approve list
APPROVED_DIGESTS=("sha256:46cb7cc2877e60fbd5e21a9ae6115c30ace7a077b9f8772da879e4590c18c2e3" "sha256:def456") # fill in your allowlist
DIGEST=$(docker pull "$IMAGE" --quiet | tail -1)

for ok in "${APPROVED_DIGESTS[@]}"; do
    [[ "$DIGEST" == "$ok" ]] && echo "[validate] OK" && exit 0
done

echo "[validate] FAIL: $IMAGE digest $DIGEST not in allowlist"
exit 1