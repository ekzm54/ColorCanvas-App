# ColorCanvasData

## Responsibility

Repository implementations and the FileSystem adapter. This is the outermost data layer that implements the repository protocols declared in `ColorCanvasDomain` (see `ADR-002-Repository-Pattern`).

## What Belongs Here

- Concrete repository implementations (local-first, offline-first per Book 0).
- FileSystem adapter code and low-level file I/O primitives.
- Caching and persistence details.

## What Must Not Belong Here

- Any `import SwiftUI` or `import UIKit`.
- Document format/versioning logic (belongs in `ColorCanvasDocument`).
- Business rules — this layer stores and retrieves data; it does not decide what the data means.

## Dependency Rules

- Depends on `ColorCanvasDomain` for the repository protocols it implements, per Book 8: `ColorCanvasData -> Document / FileSystem Adapter`.
- Never depends on `ColorCanvasUI` or `ColorCanvasApplication`.
- Consumed only via the protocols in `ColorCanvasDomain`; the app composition root injects the concrete repository — `ColorCanvasApplication` never imports this package directly, per `ADR-002-Repository-Pattern` ("UI and ViewModels must not access storage, file system, document packages, or caches directly").

## Sprint 001

- `UserDefaultsPreferencesRepository` — a safe-default (`bool(forKey:default:)` always falls back to the caller-supplied default when the key is absent) `UserDefaults`-backed implementation of `ColorCanvasDomain`'s `PreferencesRepository`. Constructed only at the app composition root (`apps/ipad`) and injected into `ColorCanvasApplication`'s `DependencyContainer`.

## Sprint 004 — Home Screen (RFC-001)

- `SampleProjectRepository` / `SampleTemplateRepository` — the "Mock Home data" deliverable: in-memory sample-data implementations of `ProjectRepositoryProtocol`/`TemplateRepositoryProtocol`, standing in for real FileManager/Document-backed persistence until later Sprints build it. Constructed only at the app composition root (`apps/ipad`) and injected into `ColorCanvasApplication`'s `DefaultHomeUseCases` — never referenced by `ColorCanvasApplication` or `ColorCanvasUI` directly.

### Bug fix

The `ColorCanvasDataTests` test target's `Package.swift` only listed `ColorCanvasData` as a dependency, yet `UserDefaultsPreferencesRepositoryTests` (Sprint 001) already explicitly `import ColorCanvasDomain`. Fixed by adding `ColorCanvasDomain` to the test target's dependencies.
