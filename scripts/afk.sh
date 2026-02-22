#!/usr/bin/env bash
set -euo pipefail

while true; do
  "$(dirname "$0")/loop.sh" -d 1000
  claude --dangerously-skip-permissions -p /plan-next-spec
done
