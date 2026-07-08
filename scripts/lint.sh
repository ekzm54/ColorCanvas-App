#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v swiftlint >/dev/null 2>&1; then
  echo "error: 'swiftlint' not found. Install it (e.g. 'brew install swiftlint') before running this script." >&2
  exit 1
fi

echo "==> Running SwiftLint"
swiftlint lint --config .swiftlint.yml --strict
