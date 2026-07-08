# ColorCanvasApplication

## Responsibility

Use cases and ViewModels that orchestrate domain logic for `ColorCanvasUI`. This is the application layer in the Clean Architecture (see `ADR-001-MVVM-Clean-Architecture`).

## What Belongs Here

- Use case types that coordinate `ColorCanvasDomain` entities and protocols.
- ViewModels / observable state objects consumed by SwiftUI views.
- Application-level state, navigation intent, and error mapping for the UI.

## What Must Not Belong Here

- SwiftUI imports — ViewModels expose state and intents, not views.
- Direct FileManager, networking, or database access.
- Direct imports of concrete engine or data packages (`ColorCanvasCanvasEngine`, `ColorCanvasSafeColor`, `ColorCanvasDocument`, `ColorCanvasData`, `ColorCanvasExport`). Depend only on the protocols declared in `ColorCanvasDomain`; concrete implementations are injected via dependency injection at the app composition root.
- Product feature logic beyond what the active Sprint/RFC defines.

## Dependency Rules

- Depends on `ColorCanvasDomain` only, per the Book 8 module boundary rule: `ColorCanvasApplication -> Repository Protocols / Engine Protocols`.
- Consumed by `ColorCanvasUI`. Must never depend on `ColorCanvasUI` or any concrete engine/data package.
