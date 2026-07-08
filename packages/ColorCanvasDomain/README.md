# ColorCanvasDomain

## Responsibility

Platform-agnostic business rules for ColorCanvas: domain entities, value types, and the repository/engine protocol contracts that outer layers implement. This is the innermost layer of the Clean Architecture (see `ADR-001-MVVM-Clean-Architecture`).

## What Belongs Here

- Domain entities and value types (e.g. project metadata, palette models, region identifiers).
- Repository protocols (storage/document contracts consumed by `ColorCanvasApplication`) — e.g. `PreferencesRepository` (Sprint 001).
- Engine protocols (rendering/safe-color/export contracts consumed by `ColorCanvasApplication`).
- Pure domain logic and validation rules with no I/O.
- `AppError` (Sprint 001) — the canonical app-wide error type. Outer layers map their own failures (FileManager errors, engine failures) to `AppError` before crossing into `ColorCanvasApplication`.

## What Must Not Belong Here

- SwiftUI, UIKit, or any UI framework import.
- FileManager, networking, or persistence code.
- Concrete engine implementations (rendering, safe color, document I/O).
- References to any other ColorCanvas package.

## Dependency Rules

- Depends on nothing else in this monorepo. This package has zero outgoing dependencies on other ColorCanvas packages.
- Every other package may depend on this one; this one depends on none of them.
- Concrete implementations of the protocols defined here live in `ColorCanvasData`, `ColorCanvasDocument`, `ColorCanvasCanvasEngine`, and `ColorCanvasSafeColor`, and are wired together at the app composition root — never imported directly by `ColorCanvasApplication` or `ColorCanvasUI`.
