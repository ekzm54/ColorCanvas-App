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
- `ColorCanvasUI` depends on `ColorCanvasApplication`, `ColorCanvasDesignSystem`, and `ColorCanvasDomain` (the last one for the plain data types screens display, e.g. `ProjectSummary`; still no dependency on any concrete engine/data package).
- `ColorCanvasApplication` depends only on the protocols declared in `ColorCanvasDomain` plus `ColorCanvasShared`'s `Logging` protocol (cross-cutting infrastructure, not a business engine) — never on the concrete `ColorCanvasCanvasEngine`, `ColorCanvasSafeColor`, `ColorCanvasDocument`, `ColorCanvasData`, or `ColorCanvasExport` packages.
- Engines (`ColorCanvasCanvasEngine`, `ColorCanvasSafeColor`, `ColorCanvasDocument`, `ColorCanvasData`, `ColorCanvasExport`) implement `ColorCanvasDomain` protocols and must never depend on `ColorCanvasUI` or `ColorCanvasApplication`. Concrete implementations are wired to their protocols at the app composition root (`apps/ipad`), not inside `ColorCanvasApplication`.
- `ColorCanvasTesting` may only be depended on by `.testTarget`s.
- See each package's own `README.md` for full detail. As of Sprint 004: `ColorCanvasData -> ColorCanvasDomain`, `ColorCanvasApplication -> ColorCanvasDomain, ColorCanvasShared`, `ColorCanvasUI -> ColorCanvasApplication, ColorCanvasDesignSystem, ColorCanvasDomain`, and `apps/ipad -> ColorCanvasUI, ColorCanvasApplication, ColorCanvasDomain, ColorCanvasShared, ColorCanvasData`. Every other package remains dependency-free — inter-package SwiftPM dependencies are added only when a Sprint introduces code that actually needs them.

**Note on test targets**: a `.testTarget`'s `dependencies:` must independently list every module its test files `import`, even ones the main target already depends on — this is a real SwiftPM/Swift rule, not stylistic. Sprint 004 found and fixed three places where it had been missed (`ColorCanvasApplicationTests`, `ColorCanvasDataTests`, `ColorCanvasUITests`) since none of these packages had ever actually been compiled — see each package's own README "Bug fix" note.
