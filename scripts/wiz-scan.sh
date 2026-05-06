#!/bin/bash
set -euo pipefail
MODE=$1 # "dockerfile" or "image"
TARGET=$2

echo "[wiz] Scanning $MODE: $TARGET"

if [[ "$MODE" == "dockerfile" ]]; then
    wizcli iac scan --path "$TARGET" --policy "dockerfile-baseline"
elif [[ "$MODE" == "image" ]]; then
    wizcli docker scan --image "$TARGET" \
        --policy "container-critical-and-high" \
        --output sarif > wiz-results.sarif
else
    echo "Unknown mode"; exit 1
fi

echo "[wiz] Scan complete"
