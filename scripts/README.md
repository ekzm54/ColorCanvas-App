# Scripts

Development scripts for ColorCanvas-App. All scripts `cd` to the repo root, are safe to run from any working directory, and exit non-zero on failure (`set -euo pipefail`).

- `build.sh` — `swift build` for every package under `packages/`, then (if `xcodegen`/`xcodebuild` are installed) generates and builds the `apps/ipad` Xcode project.
- `test.sh` — `swift test` for every package under `packages/`.
- `lint.sh` — `swiftlint lint --config .swiftlint.yml --strict`.
- `format.sh` — `swiftformat . --config .swiftformat`. Pass `--check` to verify formatting without writing changes (used in CI).

## Local Tooling Requirements

These scripts assume **macOS with Xcode installed** (for `swift`/`xcodebuild`), plus `xcodegen`, `swiftlint`, and `swiftformat` on `PATH` (e.g. via `brew install xcodegen swiftlint swiftformat`). Each script checks for its required tool up front and exits with a clear error message if it's missing, rather than building/testing the app. ColorCanvas is an iPad/SwiftUI app and cannot be built on non-Apple platforms — package-level `swift build`/`swift test` also require the Swift/Xcode toolchain, so none of these scripts can run on Linux or Windows.
