# Packages

ColorCanvas uses modular Swift packages.

## Modules

- ColorCanvasDomain
- ColorCanvasApplication
- ColorCanvasUI
- ColorCanvasDesignSystem
- ColorCanvasCanvasEngine
- ColorCanvasSafeColor
- ColorCanvasDocument
- ColorCanvasData
- ColorCanvasExport
- ColorCanvasResources
- ColorCanvasTesting
- ColorCanvasShared

## Dependency Rule

Per Book 8's module boundary rule:

```text
ColorCanvasUI -> ColorCanvasApplication -> ColorCanvasDomain
ColorCanvasApplication -> Repository Protocols / Engine Protocols
ColorCanvasData -> Document / FileSystem Adapter
ColorCanvasCanvasEngine -> Rendering / Viewport / Stroke
ColorCanvasSafeColor -> Region / Mask / Gap Repair
```

- `ColorCanvasDomain` and `ColorCanvasShared` depend on nothing else in the monorepo.
- `ColorCanvasUI` depends on `ColorCanvasApplication` and `ColorCanvasDesignSystem`.
- `ColorCanvasApplication` depends only on the protocols declared in `ColorCanvasDomain` — never on the concrete `ColorCanvasCanvasEngine`, `ColorCanvasSafeColor`, `ColorCanvasDocument`, `ColorCanvasData`, or `ColorCanvasExport` packages.
- Engines (`ColorCanvasCanvasEngine`, `ColorCanvasSafeColor`, `ColorCanvasDocument`, `ColorCanvasData`, `ColorCanvasExport`) implement `ColorCanvasDomain` protocols and must never depend on `ColorCanvasUI` or `ColorCanvasApplication`. Concrete implementations are wired to their protocols at the app composition root (`apps/ipad`), not inside `ColorCanvasApplication`.
- `ColorCanvasTesting` may only be depended on by `.testTarget`s.
- See each package's own `README.md` for full detail. As of Sprint 000, every `Package.swift` is dependency-free except `apps/ipad`, which depends on `ColorCanvasUI` — inter-package SwiftPM dependencies are added only when a Sprint introduces code that actually needs them.
