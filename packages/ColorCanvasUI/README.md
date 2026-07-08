# ColorCanvasUI

## Responsibility

SwiftUI views and reusable screen composition for ColorCanvas. Consumes `ColorCanvasApplication` ViewModels and `ColorCanvasDesignSystem` tokens/components to render the interface.

## What Belongs Here

- SwiftUI `View` types and view-only helpers (view modifiers, layout containers).
- Screen composition that binds to ViewModels exposed by `ColorCanvasApplication`.

## What Must Not Belong Here

- Business logic of any kind — views must stay declarative and delegate to `ColorCanvasApplication`.
- Direct FileManager, networking, or persistence access.
- Direct imports of `ColorCanvasDomain`, `ColorCanvasData`, `ColorCanvasDocument`, `ColorCanvasCanvasEngine`, `ColorCanvasSafeColor`, or `ColorCanvasExport`. Views reach domain/engine capability only through `ColorCanvasApplication`.
- Hard-coded colors, spacing, typography, radius, or animation values — use `ColorCanvasDesignSystem` tokens (real tokens as of Sprint 002).
- Product screens (Home, Gallery, Studio, Canvas, Safe Color, Export). Sprint 003 adds only placeholder screens — see below.

## Dependency Rules

- Depends on `ColorCanvasApplication` (for `Route`/`AppRouter`) and `ColorCanvasDesignSystem` (declared in `Package.swift` as of Sprint 003, for tokens/components) — per the Book 8 module boundary rule: `ColorCanvasUI -> ColorCanvasApplication -> ColorCanvasDomain`.
- Consumed by `apps/ipad`. Nothing in this monorepo may depend on `ColorCanvasUI`.

## Sprint 001

- `RootView` — hosts a `NavigationStack` bound to `AppRouter.path` and a `.sheet` bound to `AppRouter.presentedModal`.

## Sprint 003 — Navigation & App Shell

- `RootView` now routes every `Route` case to its own placeholder screen via `.navigationDestination(for: Route.self)`, and every `ModalRoute` case to `ModalPlaceholderScreen` via `.sheet(item:)`. `BootstrapRootView` is removed — superseded by `HomePlaceholderScreen` as the `NavigationStack`'s root content.
- `PlaceholderScreen` (internal, generic) — the one reusable "coming in Sprint N" layout every placeholder screen composes: title, message, and a caller-supplied `@ViewBuilder` actions stack, all `DesignTokens`-driven.
- `ModalPlaceholderScreen` (internal) — same idea, wrapped in its own `NavigationStack` with a toolbar "Close" button, used for every `ModalRoute` case.
- `Screens/` (all internal, none public — they're `RootView`-only implementation detail): `HomePlaceholderScreen` (routes to Gallery/Projects/Settings), `GalleryPlaceholderScreen` and `ProjectsPlaceholderScreen` (route to Studio), `SettingsPlaceholderScreen` (leaf), `StudioPlaceholderScreen` (routes to Export, and demonstrates modal presentation via "Preview Color Picker"), `ExportPlaceholderScreen` (leaf). This exact chain is Sprint 003's Done Criteria navigation flow.
- None of these screens contain real Home/Gallery/Projects/Studio/Export feature logic — each is a one-line message pointing at the Sprint where the real feature lands.
