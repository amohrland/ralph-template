#!/usr/bin/env bash
set -euo pipefail

DONE_TOKEN="<promise>ALL_SPECS_PLANNED</promise>"

while true; do
  "$(dirname "$0")/loop.sh" -d 1000

  TMPFILE=$(mktemp)
  claude --dangerously-skip-permissions -p /plan-next-spec | tee "$TMPFILE"
  if grep -qF "$DONE_TOKEN" "$TMPFILE"; then
    rm -f "$TMPFILE"
    echo ""
    echo "=== All specs planned. No more work to do. ==="
    exit 0
  fi
  rm -f "$TMPFILE"
done
