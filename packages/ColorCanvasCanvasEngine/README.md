# ColorCanvasCanvasEngine

## Responsibility

The rendering engine: viewport management, coordinate transforms, stroke/brush processing, dirty-rect tracking, and CoreGraphics fallback rendering (see Sprint 008). Implements the rendering engine protocols declared in `ColorCanvasDomain`.

## What Belongs Here

- Viewport and coordinate-transform logic.
- Stroke/brush models and input processing.
- Dirty-rect tracking and render-pass management.
- CoreGraphics-based rendering fallback paths.

## What Must Not Belong Here

- Any `import SwiftUI` or `import UIKit` view code — this is a rendering engine, not UI (Book 8: "Engines must not depend on UI").
- Direct FileManager or document persistence logic (belongs in `ColorCanvasDocument` / `ColorCanvasData`).
- Safe Color region/mask logic (belongs in `ColorCanvasSafeColor`).
- Navigation, ViewModel, or application state.

## Dependency Rules

- Depends on `ColorCanvasDomain` for the protocols it implements, per Book 8: `ColorCanvasCanvasEngine -> Rendering / Viewport / Stroke`.
- Never depends on `ColorCanvasUI` or `ColorCanvasApplication`.
- Consumed only via the protocols in `ColorCanvasDomain`; the app composition root injects the concrete engine — `ColorCanvasApplication` never imports this package directly.
