#!/bin/zsh
set -euo pipefail

export HTTP_PROXY=http://127.0.0.1:7897
export HTTPS_PROXY=http://127.0.0.1:7897
export ALL_PROXY=http://127.0.0.1:7897
export NO_PROXY=localhost,127.0.0.1,::1
export http_proxy="$HTTP_PROXY"
export https_proxy="$HTTPS_PROXY"
export all_proxy="$ALL_PROXY"
export no_proxy="$NO_PROXY"

echo "Closing Codex desktop app..."
osascript -e 'quit app "Codex"' >/dev/null 2>&1 || true
sleep 5

echo "Stopping leftover Codex desktop app-server processes..."
pkill -f '/Applications/Codex.app/Contents/Resources/codex app-server' >/dev/null 2>&1 || true
pkill -f '/Applications/Codex.app/Contents/Resources/node_repl' >/dev/null 2>&1 || true
pkill -f '/Applications/Codex.app/Contents/MacOS/Codex' >/dev/null 2>&1 || true
sleep 2

echo "Remaining Codex app-server processes:"
ps aux | grep -E 'Codex.app|/codex app-server|standalone/current/codex' | grep -v grep || true

echo "Stopping stale standalone remote-control daemon processes..."
pkill -f "$HOME/.codex/packages/standalone/current/codex app-server --remote-control" >/dev/null 2>&1 || true
pkill -f "$HOME/.codex/packages/standalone/current/codex app-server daemon pid-update-loop" >/dev/null 2>&1 || true
sleep 2

echo "Removing stale daemon locks and control socket..."
rm -f "$HOME/.codex/app-server-control/app-server-control.sock"
rm -f "$HOME/.codex/app-server-daemon/app-server.pid.lock"
rm -f "$HOME/.codex/app-server-daemon/app-server-updater.pid.lock"

echo "Starting managed daemon with remote control enabled..."
codex remote-control --enable remote_control

echo "Daemon status:"
codex app-server daemon version
