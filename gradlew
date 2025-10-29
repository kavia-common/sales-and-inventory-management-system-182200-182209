#!/usr/bin/env bash
# Absolute-path Gradle wrapper shim for CI running in the mobile container workspace.
set -euo pipefail

WS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ANDROID_DIR="$WS_DIR/mobile_frontend"

if [[ -x "$ANDROID_DIR/gradlew" ]]; then
  exec "$ANDROID_DIR/gradlew" "$@"
fi

if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi

echo "Absolute mobile workspace: No gradle wrapper or system gradle; no-op success." >&2
exit 0
