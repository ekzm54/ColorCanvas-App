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
- Hard-coded colors, spacing, typography, radius, or animation values — use `ColorCanvasDesignSystem` tokens once they exist (Sprint 002).
- Product screens (Home, Gallery, Studio, Canvas, Safe Color, Export). Sprint 000 contains only the `BootstrapRootView` placeholder used by the app shell.

## Dependency Rules

- Depends on `ColorCanvasApplication` (declared in `Package.swift` as of Sprint 001, for `Route`/`AppRouter`) and, once Sprint 002 lands, `ColorCanvasDesignSystem` — per the Book 8 module boundary rule: `ColorCanvasUI -> ColorCanvasApplication -> ColorCanvasDomain`.
- Consumed by `apps/ipad`. Nothing in this monorepo may depend on `ColorCanvasUI`.
- `ColorCanvasDesignSystem` is not yet a declared `Package.swift` dependency — it has no tokens to consume until Sprint 002. Dependencies are added only when a Sprint introduces code that actually imports them.

## Sprint 001

- `RootView` — hosts a `NavigationStack` bound to `AppRouter.path` and a `.sheet` bound to `AppRouter.presentedModal`, both currently rendering `BootstrapRootView`. This proves the router/navigation wiring end to end without introducing any product screen.
