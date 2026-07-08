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

- Depends on `ColorCanvasApplication` and `ColorCanvasDesignSystem`, per the Book 8 module boundary rule: `ColorCanvasUI -> ColorCanvasApplication -> ColorCanvasDomain`.
- Consumed by `apps/ipad`. Nothing in this monorepo may depend on `ColorCanvasUI`.
- No package dependencies are declared in `Package.swift` yet — `BootstrapRootView` needs none. Add `ColorCanvasApplication`/`ColorCanvasDesignSystem` as concrete `Package.swift` dependencies only when a Sprint actually introduces code that imports them.
