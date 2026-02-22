#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: ./afk-init.sh \"description of your idea\""
  exit 1
fi

repo_root="$(dirname "$0")/.."
idea="$1"
slug=$(echo "$idea" | tr '[:upper:]' '[:lower:]' | tr -cs '[:alnum:]' '-' | sed 's/^-//;s/-$//' | cut -c1-60)
idea_file="${repo_root}/ideas/${slug}.md"

mkdir -p "${repo_root}/ideas"
echo "$idea" > "$idea_file"

echo "Idea saved to $idea_file"

claude --dangerously-skip-permissions -p "/specify-idea $idea_file"

exec "$(dirname "$0")/afk.sh"
