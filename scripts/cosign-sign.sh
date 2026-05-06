#!/bin/bash
set -euo pipefail
IMAGE=$1

DIGEST=$(docker inspect --format='{{index .RepoDigests 0}}' "$IMAGE" 2>/dev/null || echo "$IMAGE")
echo "[cosign] Signing $DIGEST"
echo "$COSIGN_KEY" | base64 -d > /tmp/cosign.key
cosign sign --key /tmp/cosign.key "$DIGEST"
rm -f /tmp/cosign.key
echo "[cosign] Signed OK"