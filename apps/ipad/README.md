# apps/ipad

The iPad SwiftUI application target for ColorCanvas.

Responsibilities:

- App entry point
- Scene setup
- Composition root integration (wiring concrete engine/repository implementations to the protocols in `ColorCanvasDomain` — added starting Sprint 001's `DependencyContainer`)
- Root navigation shell

Must not contain core rendering, Safe Color algorithm, document package mutation logic, or repository implementation details.

## Structure

```text
apps/ipad/
  project.yml              XcodeGen manifest — source of truth for the Xcode project
  ColorCanvasApp/
    ColorCanvasApp.swift   @main App entry point
    Info.plist
    Assets.xcassets/
```

`ColorCanvas.xcodeproj` is a **generated artifact** (git-ignored) produced by [XcodeGen](https://github.com/yonaskolb/XcodeGen) from `project.yml`. Never hand-edit or commit it — edit `project.yml` and regenerate.

## Opening the project (macOS only)

```bash
cd apps/ipad
xcodegen generate
open ColorCanvas.xcodeproj
```

## Sprint 001 Scope

`ColorCanvasApp` is now the composition root: it constructs a `DependencyContainer` (from `ColorCanvasApplication`) with concrete `OSLogger` (`ColorCanvasShared`) and `UserDefaultsPreferencesRepository` (`ColorCanvasData`) instances, then renders `RootView` (`ColorCanvasUI`) bound to the container's `AppRouter`. `RootView` still only shows `BootstrapRootView` — a placeholder screen confirming the app target, local SwiftPM package wiring, navigation, and dependency injection work end to end. No product screens (Home, Gallery, Studio, Canvas, Safe Color, Export) exist yet.
