# ColorCanvasExport

## Responsibility

Export and finish pipeline: PNG/PDF rendering-to-file, share sheet integration logic, and export validation (see Sprint 010).

## What Belongs Here

- PNG/PDF export pipeline logic.
- Export format/quality options and validation.
- Share sheet coordination logic (non-UI).

## What Must Not Belong Here

- Any `import SwiftUI` view code — screen presentation belongs in `ColorCanvasUI`.
- Mutating project source data — export must be read-only with respect to the source document (`CODEX_REVIEW.md`: "Export and cache operations do not mutate project source data").
- Rendering engine internals (consume `ColorCanvasCanvasEngine` output via `ColorCanvasDomain` protocols, don't reimplement rendering).

## Dependency Rules

- Depends on `ColorCanvasDomain` for the protocols it implements/consumes.
- Never depends on `ColorCanvasUI` or `ColorCanvasApplication`.
- Consumed only via the protocols in `ColorCanvasDomain`; the app composition root injects the concrete implementation — `ColorCanvasApplication` never imports this package directly.
