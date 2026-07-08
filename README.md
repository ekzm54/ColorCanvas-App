# ColorCanvas-App

The iPad coloring app implementation monorepo for ColorCanvas.

Product, architecture, and process documentation lives in [`ekzm54/ColorCanvas-Docs`](https://github.com/ekzm54/ColorCanvas-Docs). This repository implements the Sprints defined there.

## Structure

```text
apps/ipad/                          iPad app shell (SwiftUI, built via XcodeGen)
packages/ColorCanvasDomain/         Entities + repository/engine protocols
packages/ColorCanvasApplication/    Use cases and ViewModels
packages/ColorCanvasUI/             SwiftUI views and screen composition
packages/ColorCanvasDesignSystem/   Design tokens and shared components
packages/ColorCanvasCanvasEngine/   Rendering / viewport / stroke engine
packages/ColorCanvasSafeColor/      Safe Color region/mask/gap-repair engine
packages/ColorCanvasDocument/       Document format, versioning, recovery
packages/ColorCanvasData/           Repository implementations, FileSystem adapter
packages/ColorCanvasExport/         PNG/PDF export pipeline
packages/ColorCanvasResources/      Shared assets, fonts, localization
packages/ColorCanvasTesting/        Shared test mocks/fixtures
packages/ColorCanvasShared/         Cross-cutting utilities
scripts/                            build/test/lint/format scripts
.github/workflows/                  CI
```

Each package's `README.md` documents its responsibility, boundaries, and dependency rules. See `packages/README.md` for the module dependency rule summary.

## Requirements

Building and testing this repository requires **macOS with Xcode** (Swift toolchain, `xcodebuild`) plus [XcodeGen](https://github.com/yonaskolb/XcodeGen), [SwiftLint](https://github.com/realm/SwiftLint), and [SwiftFormat](https://github.com/nicklockwood/SwiftFormat). This is an iPad/SwiftUI app and cannot be built or run on non-Apple platforms.

## Scripts

```bash
scripts/build.sh    # swift build for every package, then xcodegen + xcodebuild for apps/ipad
scripts/test.sh     # swift test for every package
scripts/lint.sh     # swiftlint --strict across the repo
scripts/format.sh   # swiftformat (pass --check to verify without writing)
```

## Status

- Sprint 000 (Project Bootstrap) is complete: repository structure, package skeletons, tooling, and CI are in place.
- Sprint 001 (Foundation) is complete: `AppEnvironment`, `DependencyContainer`, `AppRouter`/`Route`, `ScreenState`, `AppError`/`ErrorMessageMapper`, a `Logging` skeleton (`OSLogger`), a `PreferencesRepository` skeleton (`UserDefaultsPreferencesRepository`), a `DesignTokens` namespace anchor, and a `RootView` wired to the composition root in `apps/ipad`.
- Sprint 002 (Design System) is complete: the full token catalog (`Space`, `Radius`, `BorderWidth`, `Elevation`, `AnimationToken`, `OpacityToken`, `IconSize`, `ButtonSize`, `Size`, a light/dark-adaptive semantic `Color` system, `Typography`, `ComponentState`/`ComponentStateToken`) plus reusable components (`PrimaryButton`, `SecondaryButton`, `IconButton`, `ToolButton`, `BaseCard`, `ProjectCardSkeleton`, `TemplateCardSkeleton`, `EmptyStateView`, `ErrorStateView`, `LoadingStateView`) and a `PreviewMatrix`, all in `ColorCanvasDesignSystem`.
- Sprint 003 (Navigation & App Shell) is complete: `Route` (home/gallery/projects/settings/studio/export) and a separate `ModalRoute` (templateDetail/colorPicker/brushPanel/renameProject/deleteConfirmation/shareSheet) type, `AppRouter` retyped against both, a `DeepLinkRouter` skeleton, and `ColorCanvasUI` now depends on `ColorCanvasDesignSystem` for the first time — `RootView` routes every `Route` to a token-driven placeholder screen (Home → Gallery/Projects/Settings → Studio → Export, matching the sprint's required navigation flow) and every `ModalRoute` to a placeholder sheet.
- Sprint 004 (Home Screen, `RFC-001-Home-Screen`) is complete: the app's **first real product screen**. `HomeView` (loading/empty/error/ready states, exactly matching the sprint's required `HomeState`) with `ContinueProjectCard`, `FeaturedTemplateSection`, `CategorySection`, `RecentProjectsSection`; `HomeViewModel` calling only `HomeUseCases`/`AppRouter`; `ProjectRepositoryProtocol`/`TemplateRepositoryProtocol` (`ColorCanvasDomain`) backed by sample-data `ColorCanvasData` implementations until real persistence exists. Also fixed three latent SwiftPM test-target dependency bugs (`ColorCanvasApplicationTests`, `ColorCanvasDataTests`, `ColorCanvasUITests` were each missing an explicitly-imported module) and one missing-import bug in `ColorCanvasUI` — both present since earlier Sprints and undetected because this environment has no Swift compiler to catch them; see the affected packages' READMEs for detail.

Gallery, Projects, Studio, Canvas, Safe Color, Export, and Settings remain placeholders — see `docs/sprints/Sprint-Index.md` in the Docs repository for what comes next (Sprint 005 — Gallery Screen).