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

- Depends on `ColorCanvasDomain` (protocols, `AppError`) and `ColorCanvasShared` (the `Logging` protocol — cross-cutting infrastructure, not a business engine, so it sits outside the Book 8 module boundary rule), per the Book 8 module boundary rule: `ColorCanvasApplication -> Repository Protocols / Engine Protocols`.
- Consumed by `ColorCanvasUI`. Must never depend on `ColorCanvasUI` or any concrete engine/data package (`ColorCanvasCanvasEngine`, `ColorCanvasSafeColor`, `ColorCanvasDocument`, `ColorCanvasData`, `ColorCanvasExport`).

## Sprint 001 — Foundation

- `Route` / `AppRouter` — navigation stack + modal state (`push`/`pop`/`popToRoot`/`presentModal`/`dismissModal`). Pure state mutation, no business logic, per the Sprint 001 critical rule "AppRouter must not contain business logic."
- `ScreenState<Value>` — the required state-enum convention (`idle`/`loading`/`loaded`/`failed`) ViewModels use instead of multiple boolean flags (`AI_RULES.md` rule 6).
- `ErrorMessageMapping` / `DefaultErrorMessageMapper` — maps `AppError` to a user-facing string for the UI to display.
- `AppEnvironment` — holds the resolved shared services (`logger`, `preferences`, `errorMessageMapper`, `router`), all protocol-typed.
- `DependencyContainer` — builds an `AppEnvironment` from concrete `Logging`/`PreferencesRepository` instances supplied by the caller. The container itself never constructs `OSLogger` or `UserDefaultsPreferencesRepository` — only the app composition root (`apps/ipad`) does that, keeping this package decoupled from `ColorCanvasData`.
