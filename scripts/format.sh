#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v swiftformat >/dev/null 2>&1; then
  echo "error: 'swiftformat' not found. Install it (e.g. 'brew install swiftformat') before running this script." >&2
  exit 1
fi

MODE="${1:-write}"

case "$MODE" in
  --check|check)
    echo "==> Checking formatting (no changes will be made)"
    swiftformat . --config .swiftformat --lint
    ;;
  write|--write)
    echo "==> Formatting source files"
    swiftformat . --config .swiftformat
    ;;
  *)
    echo "error: unknown mode '$MODE'. Use no argument (write) or --check." >&2
    exit 1
    ;;
esac
