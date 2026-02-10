#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "/implement-next-task" | claude -p --output-format stream-json --verbose --dangerously-skip-permissions | "$SCRIPT_DIR/parse-claude" --compact | "$SCRIPT_DIR/show-turn-timing.sh"
