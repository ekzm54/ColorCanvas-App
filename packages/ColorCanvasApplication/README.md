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

- `ScreenState<Value>` — the required state-enum convention (`idle`/`loading`/`loaded`/`failed`) ViewModels use instead of multiple boolean flags (`AI_RULES.md` rule 6).
- `ErrorMessageMapping` / `DefaultErrorMessageMapper` — maps `AppError` to a user-facing string for the UI to display.
- `AppEnvironment` — holds the resolved shared services (`logger`, `preferences`, `errorMessageMapper`, `router`), all protocol-typed.
- `DependencyContainer` — builds an `AppEnvironment` from concrete `Logging`/`PreferencesRepository` instances supplied by the caller. The container itself never constructs `OSLogger` or `UserDefaultsPreferencesRepository` — only the app composition root (`apps/ipad`) does that, keeping this package decoupled from `ColorCanvasData`.

## Sprint 003 — Navigation & App Shell

- `Route` — push-navigation destinations: `home`, `gallery(categoryID:)`, `projects`, `settings`, `studio(projectID:)`, `export(projectID:)`. Pure data (no `import SwiftUI`, no View reference anywhere), satisfying the critical rule "Route must not contain View."
- `ModalRoute` — a **separate** type for sheet-presented destinations: `templateDetail`, `colorPicker`, `brushPanel`, `renameProject`, `deleteConfirmation`, `shareSheet`. `AppRouter.presentedModal` is typed `ModalRoute?`, never `Route?` — this is what satisfies "Modal navigation must be separate from push navigation," not just a naming convention.
- `AppRouter` — unchanged shape from Sprint 001 (`path: [Route]`, `presentedModal: ModalRoute?`, `push`/`pop`/`popToRoot`/`presentModal`/`dismissModal`), now typed against the real route sets above. Still pure state mutation: no `UseCase` calls, no `Repository` access, per this sprint's critical rules.
- `DeepLinkRouter` (`DeepLinking` protocol) — a skeleton URL-to-`Route` mapper (`colorcanvas://gallery?category=X`, `colorcanvas://studio/<projectID>`, etc.). Returns `nil` for anything it doesn't recognize rather than guessing.

`ProjectID`/`TemplateID`/`CategoryID`/`ExportID` used by `Route`/`ModalRoute` are defined in `ColorCanvasDomain` (see its README) since identity is a domain concept — this package only consumes them.

## Sprint 004 — Home Screen (RFC-001)

- `HomeState` (`loading`/`ready(HomeViewData)`/`empty`/`error(AppError)`) — implemented exactly as specified in `Sprint004-Home-Screen.md`'s Required State, not the generic `ScreenState<Value>`; Home's states don't fit that shape (no `idle`, and `empty` is a distinct first-class case from `ready` with no data).
- `HomeViewData` — the `.ready` payload: `continueProject`, `featuredTemplates`, `categories`, `recentProjects`.
- `HomeUseCases` (protocol) / `DefaultHomeUseCases` — orchestrates `ProjectRepositoryProtocol` + `TemplateRepositoryProtocol` (both `ColorCanvasDomain`) into a single `loadHome() async throws -> HomeViewData` call. This is the only place that touches the repository protocols — `HomeViewModel` never does.
- `HomeViewModel` (`@MainActor`) — calls **only** `HomeUseCases` and `AppRouter`, per this sprint's critical rule "HomeViewModel must call UseCases and AppRouter only." Maps `AppError` to a display string via `ErrorMessageMapping` (reused from Sprint 001) rather than the View doing it. Routes: continue/recent project → `.studio`, category → `.gallery(categoryID:)`, template → `.templateDetail` modal, settings → `.settings`, search → `.gallery(categoryID: nil)` (per the sprint's "Search entry may route to Gallery placeholder/search mode" rule).

### Bug fix

The `ColorCanvasApplicationTests` test target's `Package.swift` only listed `ColorCanvasApplication` as a dependency, yet multiple test files (since Sprint 001) explicitly `import ColorCanvasDomain`/`import ColorCanvasShared`. Swift requires every module a file explicitly imports to be a declared dependency of that specific target — this would have failed `swift test` the first time it actually ran on a machine with the toolchain installed. Fixed by adding both to the test target's dependencies.
