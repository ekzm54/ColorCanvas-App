# ColorCanvasUI

## Responsibility

SwiftUI views and reusable screen composition for ColorCanvas. Consumes `ColorCanvasApplication` ViewModels and `ColorCanvasDesignSystem` tokens/components to render the interface.

## What Belongs Here

- SwiftUI `View` types and view-only helpers (view modifiers, layout containers).
- Screen composition that binds to ViewModels exposed by `ColorCanvasApplication`.

## What Must Not Belong Here

- Business logic of any kind — views must stay declarative and delegate to `ColorCanvasApplication`.
- Direct FileManager, networking, or persistence access.
- Direct imports of `ColorCanvasData`, `ColorCanvasDocument`, `ColorCanvasCanvasEngine`, `ColorCanvasSafeColor`, or `ColorCanvasExport`. Views reach engine/repository capability only through `ColorCanvasApplication`.
- Hard-coded colors, spacing, typography, radius, or animation values — use `ColorCanvasDesignSystem` tokens (real tokens as of Sprint 002).
- Product screens beyond what the active Sprint implements (Gallery, Studio, Canvas, Safe Color, Export remain placeholders; Home is real as of Sprint 004 — see below).

## Dependency Rules

- Depends on `ColorCanvasApplication` (for `Route`/`AppRouter`/ViewModels), `ColorCanvasDesignSystem` (tokens/components), and `ColorCanvasDomain` (declared in `Package.swift` as of Sprint 004, for the plain data types — `ProjectSummary`/`TemplateSummary`/`Category`/`ProjectID`/etc. — that screens display; this is presentation of data, not business logic, so it doesn't violate MVVM). Per the Book 8 module boundary rule: `ColorCanvasUI -> ColorCanvasApplication -> ColorCanvasDomain`.
- Consumed by `apps/ipad`. Nothing in this monorepo may depend on `ColorCanvasUI`.

## Sprint 001

- `RootView` — hosts a `NavigationStack` bound to `AppRouter.path` and a `.sheet` bound to `AppRouter.presentedModal`.

## Sprint 003 — Navigation & App Shell

- `RootView` now routes every `Route` case to its own placeholder screen via `.navigationDestination(for: Route.self)`, and every `ModalRoute` case to `ModalPlaceholderScreen` via `.sheet(item:)`. `BootstrapRootView` is removed — superseded by `HomePlaceholderScreen` as the `NavigationStack`'s root content.
- `PlaceholderScreen` (internal, generic) — the one reusable "coming in Sprint N" layout every placeholder screen composes: title, message, and a caller-supplied `@ViewBuilder` actions stack, all `DesignTokens`-driven.
- `ModalPlaceholderScreen` (internal) — same idea, wrapped in its own `NavigationStack` with a toolbar "Close" button, used for every `ModalRoute` case.
- `Screens/` (all internal, none public — they're `RootView`-only implementation detail): `HomePlaceholderScreen` (routes to Gallery/Projects/Settings), `GalleryPlaceholderScreen` and `ProjectsPlaceholderScreen` (route to Studio), `SettingsPlaceholderScreen` (leaf), `StudioPlaceholderScreen` (routes to Export, and demonstrates modal presentation via "Preview Color Picker"), `ExportPlaceholderScreen` (leaf). This exact chain is Sprint 003's Done Criteria navigation flow.
- None of these screens contain real Gallery/Projects/Studio/Export feature logic — each is a one-line message pointing at the Sprint where the real feature lands.

## Sprint 004 — Home Screen (RFC-001)

- `Screens/Home/HomeView` (public) — the real Home screen, replacing the Sprint 003 `HomePlaceholderScreen` (deleted). Switches on `HomeViewModel.state`: `.loading` → `LoadingStateView`, `.empty` → `EmptyStateView`, `.error` → `ErrorStateView` (with retry), `.ready` → header + `ContinueProjectCard` + `FeaturedTemplateSection` + `CategorySection` + `RecentProjectsSection`. Contains zero business logic — every tap forwards straight to a `HomeViewModel` method; the View never touches `FileManager` or constructs a UseCase/repository itself.
- `ContinueProjectCard`, `FeaturedTemplateSection`, `CategorySection`, `RecentProjectsSection` (all internal) — reuse `ColorCanvasDesignSystem`'s `ProjectCardSkeleton`/`TemplateCardSkeleton` from Sprint 002 rather than duplicating card layouts.
- `RootView` now takes `homeUseCases: HomeUseCases` and `errorMessageMapper: ErrorMessageMapping` (in addition to `router`) so it can construct a real `HomeViewModel` for both the `NavigationStack` root and the `.home` case in `.navigationDestination`.

### Bug fixes

- `Package.swift` did not declare `ColorCanvasDomain` as a dependency, yet `GalleryPlaceholderScreen`, `StudioPlaceholderScreen`, `ExportPlaceholderScreen`, `ProjectsPlaceholderScreen` (Sprint 003), and `ScreensSmokeTests` all explicitly named `ProjectID`/`CategoryID`/`TemplateID`/`ExportID` without importing the module that declares them. Swift requires an explicit `import` (and a matching `Package.swift` dependency edge) for every module whose types are named directly in a file — this would have failed to compile the first time `swift build` actually ran. Fixed by adding `ColorCanvasDomain` to both the main and test targets, and adding the missing `import ColorCanvasDomain` to each affected file.
- The test target was also missing `ColorCanvasApplication` itself (needed by `RootViewTests`, `ScreensSmokeTests`, `HomeScreenSmokeTests`, all present since Sprint 003) — fixed in the same pass.
