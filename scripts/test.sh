#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v swift >/dev/null 2>&1; then
  echo "error: 'swift' toolchain not found. Install Xcode / the Swift toolchain before running this script." >&2
  exit 1
fi

echo "==> Testing Swift packages"
for package_dir in packages/*/; do
  if [ -f "${package_dir}Package.swift" ]; then
    echo "--> swift test: ${package_dir}"
    (cd "$package_dir" && swift test)
  fi
done

echo "==> Tests complete"
