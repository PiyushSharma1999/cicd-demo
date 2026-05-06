#!/bin/bash
set -euo pipefail
IMAGE=$1

echo "[cosign] Singing $IMAGE"
echo "$COSIGN_KEY" | base64 -d > /tmp/cosign.key
cosign sign --key /tmp/cosign.key "$IMAGE"
rm -f /tmp/cosign.key
echo "[cosign] Signed OK"