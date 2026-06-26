#!/usr/bin/env bash
# command.sh — Start the backend server and patch env.dart with the correct URL.
# Run this before launching the Flutter app from Android Studio.
#
# Usage:
#   ./command.sh               # simulator (default) — uses localhost
#   ./command.sh simulator     # same as above
#   ./command.sh device        # physical device — auto-detects LAN IP
#   ./command.sh stop          # kill the running backend
#
# NOTE: `device` mode (LAN IP) ALSO works for the iOS simulator / Android
# emulator, since they can reach the Mac's LAN IP too. So if you're running a
# physical device (alone or alongside a simulator), use `device`. Only use
# `simulator` when you have no physical device on the network.
#
# Physical device prerequisites:
#   1. Mac and device on the same Wi-Fi network.
#   2. macOS firewall must allow Python on port 8000:
#      System Settings → Network → Firewall → Allow Python.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_DIR="$(cd "$SCRIPT_DIR/../nutri-app-backend" && pwd)"
ENV_FILE="$SCRIPT_DIR/lib/core/config/env.dart"
BACKEND_LOG="/tmp/nutri-backend.log"

MODE="${1:-simulator}"

# Free whatever is bound to :8000 — covers servers started outside this script
# (e.g. `make run`) and stale autoreload children that pkill-by-name misses.
free_port_8000() {
  pkill -f "manage.py runserver" 2>/dev/null || true
  local pids
  pids="$(lsof -ti:8000 2>/dev/null || true)"
  if [[ -n "$pids" ]]; then
    # shellcheck disable=SC2086
    kill $pids 2>/dev/null || true
    sleep 1
    pids="$(lsof -ti:8000 2>/dev/null || true)"
    # shellcheck disable=SC2086
    [[ -n "$pids" ]] && kill -9 $pids 2>/dev/null || true
  fi
}

# ─── stop ─────────────────────────────────────────────────────────────────────

if [[ "$MODE" == "stop" ]]; then
  if [[ -n "$(lsof -ti:8000 2>/dev/null || true)" ]]; then
    free_port_8000
    echo "Backend stopped."
  else
    echo "No backend was running."
  fi
  exit 0
fi

if [[ "$MODE" != "simulator" && "$MODE" != "device" ]]; then
  echo "Usage: ./command.sh [simulator|device|stop]"
  exit 1
fi

# ─── 1. Kill stale backend ────────────────────────────────────────────────────

if [[ -n "$(lsof -ti:8000 2>/dev/null || true)" ]]; then
  echo "Freeing port 8000 (stale backend)..."
  free_port_8000
fi

# ─── 2. Resolve URL ───────────────────────────────────────────────────────────

if [[ "$MODE" == "simulator" ]]; then
  # iOS simulator shares the Mac's loopback — localhost reaches the host directly.
  BASE_URL="http://localhost:8000/api/v1"
  echo "Mode : simulator"
else
  # Physical device needs the Mac's LAN IP (en0 = Wi-Fi on most Macs).
  LAN_IP="$(ipconfig getifaddr en0 2>/dev/null || true)"
  if [[ -z "$LAN_IP" ]]; then
    echo "Error: could not detect LAN IP. Is Wi-Fi (en0) connected?"
    exit 1
  fi
  BASE_URL="http://$LAN_IP:8000/api/v1"
  echo "Mode : physical device"
  echo "LAN  : $LAN_IP"
  echo ""
  echo "  ⚠  macOS firewall must allow Python on port 8000."
  echo "     System Settings → Network → Firewall → Allow Python"
  echo ""
fi

echo "URL  : $BASE_URL"

# ─── 3. Patch env.dart ────────────────────────────────────────────────────────

sed -i '' \
  "s|static const String apiBaseUrl = '.*';|static const String apiBaseUrl = '$BASE_URL';|" \
  "$ENV_FILE"
echo "env.dart patched."

# ─── 4. Start backend ─────────────────────────────────────────────────────────

echo "Starting backend (log → $BACKEND_LOG)..."
cd "$BACKEND_DIR"
.venv/bin/python manage.py runserver 0.0.0.0:8000 >"$BACKEND_LOG" 2>&1 &
BACKEND_PID=$!

# Wait up to 15 s for the server to be healthy.
echo -n "Waiting"
READY=0
for i in $(seq 1 15); do
  if curl -s http://localhost:8000/healthz >/dev/null 2>&1; then
    READY=1
    break
  fi
  echo -n "."
  sleep 1
done
echo ""

if [[ $READY -eq 0 ]]; then
  echo "Backend failed to start. Last log:"
  tail -20 "$BACKEND_LOG"
  exit 1
fi

echo "Backend ready (PID $BACKEND_PID)."
echo ""
echo "You can now run the Flutter app from Android Studio."
echo "To stop the server: ./command.sh stop"

# Keep the script alive so the server stays running.
# Press Ctrl-C to stop.
trap 'echo ""; echo "Stopping backend..."; kill $BACKEND_PID 2>/dev/null || true; exit 0' INT TERM
wait $BACKEND_PID
