#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v swift >/dev/null 2>&1; then
  echo "error: 'swift' toolchain not found. Install Xcode / the Swift toolchain before running this script." >&2
  exit 1
fi

echo "==> Building Swift packages"
for package_dir in packages/*/; do
  if [ -f "${package_dir}Package.swift" ]; then
    echo "--> swift build: ${package_dir}"
    (cd "$package_dir" && swift build)
  fi
done

if command -v xcodegen >/dev/null 2>&1 && command -v xcodebuild >/dev/null 2>&1; then
  echo "==> Generating Xcode project for apps/ipad"
  (cd apps/ipad && xcodegen generate)

  echo "==> Building ColorCanvas app"
  xcodebuild build \
    -project apps/ipad/ColorCanvas.xcodeproj \
    -scheme ColorCanvas \
    -destination "generic/platform=iOS Simulator"
else
  echo "warning: 'xcodegen' and/or 'xcodebuild' not found — skipping apps/ipad build." >&2
  echo "warning: install Xcode and XcodeGen on macOS to build the iPad app target." >&2
fi

echo "==> Build complete"
