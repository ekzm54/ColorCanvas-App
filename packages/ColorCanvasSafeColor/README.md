# ColorCanvasSafeColor

## Responsibility

The Safe Color engine: region detection, mask generation, gap repair, hit testing, clipping, and result caching (see `RFC-006-Safe-Color-Engine`, Sprint 009). Safe Color is a core product differentiator per Book 0 and must remain accurate above almost all other concerns.

## What Belongs Here

- Region, mask, and gap-repair algorithms.
- Hit testing and clipping logic for coloring operations.
- Safe Color result caching.

## What Must Not Belong Here

- Any `import SwiftUI` or `import UIKit` — this is an engine, not UI (Book 8: "Engines must not depend on UI").
- Rendering/viewport logic (belongs in `ColorCanvasCanvasEngine`).
- Document persistence (belongs in `ColorCanvasDocument` / `ColorCanvasData`).
- Any shortcut that trades Safe Color accuracy for performance — never disable Safe Color to solve a performance problem (`AI_RULES.md`).

## Dependency Rules

- Depends on `ColorCanvasDomain` for the protocols it implements, per Book 8: `ColorCanvasSafeColor -> Region / Mask / Gap Repair`.
- Never depends on `ColorCanvasUI` or `ColorCanvasApplication`.
- Consumed only via the protocols in `ColorCanvasDomain`; the app composition root injects the concrete engine — `ColorCanvasApplication` never imports this package directly.
