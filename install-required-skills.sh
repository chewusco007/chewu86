#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="$HOME/.codex/skills"

mkdir -p "$DEST_DIR"
rm -rf "$DEST_DIR/frontend-design" "$DEST_DIR/humanizer"
cp -R "$ROOT_DIR/local-skills/frontend-design" "$DEST_DIR/frontend-design"
cp -R "$ROOT_DIR/local-skills/humanizer" "$DEST_DIR/humanizer"

echo
echo "Installed skills:"
ls "$DEST_DIR" | grep -E '^(frontend-design|humanizer)$'
echo
echo "Restart Codex to pick up new skills."
